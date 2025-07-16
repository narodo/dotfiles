return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    dependencies = {
        "OXY2DEV/markview.nvim",
    },

    build = ":TSUpdate",
    event = "BufReadPre",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = { "c", "lua", "rust", "python", "cpp" },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
