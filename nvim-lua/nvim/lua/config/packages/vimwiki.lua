local M = {}

function M.setup()

    vim.g.vimwiki_list = { {path = '~/tools/vimwiki/',  ext = '.md'} }

    local function DailyTemplate ()
        local date = os.date("%Y-%b-%d %H:%M")

        -- vim.api.nvim_buf_set_lines(0, 1, 1, true, {"first line"})
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

end

return M
