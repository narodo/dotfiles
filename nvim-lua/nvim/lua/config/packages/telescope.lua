local M = {}

function M.setup()

    local telescope = require "telescope"

    telescope.setup {
        defaults = {
            borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
            layout_strategy = "vertical",
            layout_config = {
                height = 0.90,
                prompt_position = "top",
                preview_height = 15,
            },
            prompt_prefix = "> ",
            sorting_strategy = "ascending",
            cache_picker = {
                num_pickers = 20,
            },
            dynamic_preview_title = true,
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
            buffers = {
                theme = "dropdown",
                sort_lastused = true,
                mappings = {
                    i = {
                        ["<c-d>"] = "delete_buffer",
                    }
                }
            },

            live_grep = {
                theme = "dropdown",
            },
            find_files = {
                theme = "dropdown",
            }
        },
        extensions = {
            -- Your extension configuration goes here:
            project = {
                theme = "dropdown",
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
        }
    }

    require('telescope').load_extension('project')
    require('telescope').load_extension('file_browser')
end

return M
