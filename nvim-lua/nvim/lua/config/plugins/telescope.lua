local Path = require "plenary.path"
local telescope_actions = require("telescope.actions.state")
vim.api.nvim_create_user_command('CustomTSBufPicker',
    function()
        local builtin = require('telescope.builtin')
        local action_state = require('telescope.actions.state')

        builtin.buffers({
            initial_mode = "insert",
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

function OpenInOil(entry)
    local newPath = Path.new(entry.value)
    if not Path.exists(newPath) then
        print("Not a valid path -", Path.expand(newPath))
        return
    end

    local pathDir
    if Path.is_file(newPath) then
       pathDir = Path.expand(Path.parent(newPath))
    else
       pathDir = Path.expand(newPath)
    end
    require("oil").open_float(pathDir)
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
        -- require("telescope").setup {
        defaults = {
            theme = "dropdown",
            layout_strategy = "vertical",
            layout_config = {
                prompt_position = "top",
            },
            prompt_prefix = "> ",
            sorting_strategy = "ascending",
            cache_picker = {
                num_pickers = 20,
            },
            dynamic_preview_title = true,

            mappings = {
                n = {
                    ["o"] = function()
                        OpenInOil(telescope_actions.get_selected_entry())
                    end,
                }
            },
        },
        pickers = {
            buffers = {
                theme = "dropdown",
                ingnore_current_buffer = true,
                sort_mru = true,
                path_display = { "truncate" },
            },
        },
        extensions = {
            -- Your extension configuration goes here:
            project = {
                theme = "dropdown",
                explicit_set_cwd = true,
            },
            file_browser = {
                grouped = true,
                previewer = false,
                hijack_netrw = true,
                theme = "dropdown",
                dir_icon = "📁",
                display_stat = {
                    date = true,
                    size = true,
                }
            },
        },
    }
}
