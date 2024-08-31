local Path = require "plenary.path"

vim.api.nvim_create_user_command('CustomTSBufPicker',
    function()
        local builtin = require('telescope.builtin')
        local action_state = require('telescope.actions.state')

        builtin.buffers({
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
        }, {})
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command('TelescopeFindFileCWD',
    function()
        vim.ui.input({ prompt = 'Path: ', completion = "file" },
            function(input)
                require("telescope.builtin").find_files({cwd = input})
                -- if nvim-tree is open already it does not reliably update the root node
                -- to workaround this we close it first
            end
        )
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
        "fbuchlak/telescope-directory.nvim",
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
                        local telescope_actions = require("telescope.actions.state")
                        OpenInOil(telescope_actions.get_selected_entry())
                    end,
                }
            },
        },
        pickers = {
            buffers = {
                ingnore_current_buffer = true,
                sort_mru = true,
                path_display = { "truncate" },
            },
        },

        extensions = {
            directory = {
                feature = {
                },
            },
        },
    }
}
