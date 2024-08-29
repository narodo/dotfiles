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
