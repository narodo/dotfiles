return {
    {
        'mhartington/formatter.nvim',
        config = function()
            require("formatter").setup {
                filetype = {
                    cpp = {
                        require("formatter.filetypes.cpp").clangformat,
                    },
                    c = {
                        require("formatter.filetypes.c").clangformat,
                    },
                },
            }
        end,
    },
}
