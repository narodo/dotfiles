vim.api.nvim_create_user_command('CustomTSBufPicker',
    function()
        local builtin = require('telescope.builtin')
        local action_state = require('telescope.actions.state')

        builtin.buffers({
            initial_mode = "normal",
            attach_mappings = function(prompt_bufnr, map)
                local delete_buf = function()
                    local current_picker = action_state.get_current_picker(prompt_bufnr)
                    current_picker:delete_selection(function(selection)
                        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                    end)
                end
                map('n', '<c-d>', delete_buf)
                return true
            end
        }, { })
    end,
    { nargs = 0 }
)
