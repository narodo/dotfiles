local zettelkastenHome = vim.fn.expand("~/zettelkasten")

return {
    'renerocksai/telekasten.nvim',

    dependencies = {
        'nvim-telescope/telescope.nvim',
        'mattn/calendar-vim',
    },


    config = function()
        require('telekasten').setup({
            home = zettelkastenHome,
            take_over_my_home = false,
            auto_set_filetype = false,
            dailies = vim.fn.expand("~/zettelkasten/dailies"),
            templates = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates"),
            template_new_daily = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates/daily.md"),
            template_new_note = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates/newNote.md"),
        })
    end,

    init = function()
        vim.api.nvim_create_user_command("SyncZettelkasten", function(params)
            local task = require("overseer").new_task({
                cmd = { "bash" },
                args = { "-c", "git add * && git commit -m 'Automated commit' && git push" },
                cwd = zettelkastenHome,
                components = {
                    { "mycomps.nvimNotify" },
                    { "on_output_quickfix", open_on_exit = "failure", open_height = 8 },
                    "default",
                },
            })
            task:start()
        end, {
            desc = "Push zettelkasten home directory to git",
            nargs = "*",
            bang = true,
        })
    end
}
