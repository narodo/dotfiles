local M = {}

function M.setup()

    local rootPath = '~/tools/vimwiki/'
    local wiki_work = {path = rootPath .. 'work', name = 'work', ext = '.md'}
    local wiki_private = {path = rootPath .. '/private', name = 'private', ext = '.md'}

    vim.g.vimwiki_list = {wiki_work, wiki_private}

    local function DailyTemplate ()
        local date = os.date("%Y-%b-%d %H:%M")

        vim.api.nvim_buf_set_lines(0, 0, 0, true, {"= Daily Note: " .. date .. " ="})
        vim.api.nvim_buf_set_lines(0, -1, -1, true, {"== To-Do =="})
        vim.api.nvim_buf_set_lines(0, -1, -1, true, {""})
        vim.api.nvim_buf_set_lines(0, -1, -1, true, {""})
        vim.api.nvim_buf_set_lines(0, -1, -1, true, {"== Notes =="})
        vim.api.nvim_buf_set_lines(0, -1, -1, true, {""})
        vim.api.nvim_buf_set_lines(0, -1, -1, true, {""})
        vim.api.nvim_win_set_cursor(0, {8,0})
    end

    vim.api.nvim_create_autocmd("BufNewFile", {
        pattern = {"*/diary/[0-9]*.md"},
        callback = DailyTemplate,
    })

    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
        pattern = {"*/diary.md"},
        command = "VimwikiDiaryGenerateLinks",
    })

    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
        pattern = {"*.md"},
        command = "lua vim.diagnostic.disable(0)",
    })

    vim.api.nvim_create_user_command("Diary", "VimwikiDiaryIndex", {})

end

return M
