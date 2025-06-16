-- global zettelkasten directory that contains our vaults
local zettelkastenHome = vim.fn.expand("~/zettelkastenVaults")

-- this is the config that is used by all vaults
local defaultVaultConfig = {
    take_over_my_home = false,
    auto_set_filetype = false,
    dailies = "dailies",
    templates = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates"),
    template_new_daily = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates/daily.md"),
    template_new_note = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates/newNote.md"),
    clipboard_program = "xsel",
}

-- Get vaults from directory
local function getVaults(base_path)
    local genVaultList = {}
    local children = vim.fn.readdir(base_path) -- Read contents of the directory

    if not children then
        vim.notify("Error: Zettelkasten path does not exist or is not readable: " .. base_path,
            vim.log.levels.ERROR)
        return genVaultList
    end

    -- check if we have directories that contain a .git file
    -- add those files to our vault list
    for _, vaultName in ipairs(children) do
        local full_path = base_path .. "/" .. vaultName
        local git_dir_path = full_path .. "/.git"

        -- Check if the child is a directory and contains a .git directory
        local stat = vim.loop.fs_stat(full_path)
        if stat and stat.type == "directory" then
            local git_stat = vim.loop.fs_stat(git_dir_path)
            if git_stat and git_stat.type == "directory" then
                genVaultList[vaultName] = vim.deepcopy(defaultVaultConfig)
                genVaultList[vaultName]["home"] = full_path
            else
                vim.notify("Ignoring Telekasten vault: " .. full_path .. ". Not a git repo!", vim.log.levels.WARN)
            end
        end
    end
    return genVaultList
end

local function syncGitRepo(path, name)
    if not vim.loop.fs_stat(path) then
        vim.notify("Error: Git repository path does not exist: " .. path, vim.log.levels.ERROR)
        return
    end
    local task_name = "Git Sync: " .. vim.fn.fnamemodify(path, ":t") -- Get the base name of the directory
    local task = require("overseer").new_task({
        name = task_name,
        cmd = { "bash" },
        -- if we don't have anything to commit 'git commit' will return 1. Make sure it always returns 0
        args = { "-c", "git add * && git commit -m 'Automated commit' > /dev/null || true && git push" },
        cwd = path,
        components = {
            { "mycomps.nvimNotify" },
            { "on_output_quickfix", open_on_exit = "failure", open_height = 8 },
            "default",
        },
    })
    task:start()
end

return {
    'renerocksai/telekasten.nvim',

    dependencies = {
        'nvim-telescope/telescope.nvim',
        'mattn/calendar-vim',
    },


    config = function()
        local vaultList = getVaults(zettelkastenHome)
        -- if we have a work entry, use that as our default home
        local homePath = ""
        if vaultList["work"] == nil then
            homePath = "~/zettelkasten"
        else
            homePath = vaultList["work"]["home"]
        end
        require('telekasten').setup({
            home = homePath,
            take_over_my_home = false,
            auto_set_filetype = false,
            dailies = "dailies",
            templates = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates"),
            template_new_daily = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates/daily.md"),
            template_new_note = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates/newNote.md"),
            vaults = vaultList,
            clipboard_program = "xsel",
        })
    end,

    init = function()
        vim.api.nvim_create_user_command("SyncZettelkasten", function(params)
            local vaultList = getVaults(zettelkastenHome)
            if next(vaultList) == nil then
                vim.notify("No vault repositories found in " .. zettelkastenHome .. " for synchronization.",
                    vim.log.levels.WARN)
                return
            end

            vim.notify("Starting Git synchronization for repositories in " .. zettelkastenHome .. "...",
                vim.log.levels.INFO)

            -- sync all vaults
            for vaultName, vaultPath in pairs(vaultList) do
                syncGitRepo(vaultPath["home"], vaultName)
            end
        end, {
            desc = "Push zettelkasten home directory to git",
            nargs = "*",
            bang = true,
        })
    end
}
