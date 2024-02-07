local M = {}

function M.setup()

    local telescope = require "telescope"

    telescope.setup {
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
        },
        pickers = {
            buffers = {
                theme = "dropdown",
                sort_lastused = true,
                path_display={"truncate"},
                mappings = {
                    i = {
                        ["<c-d>"] = "delete_buffer",
                    }
                }
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
        }
    }

    -- require('telescope').load_extension('project')
    require('telescope').load_extension('file_browser')
end

return M
