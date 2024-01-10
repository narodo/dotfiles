local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false

    -- packer.nvim configuration
    local conf = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    }

    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            packer_bootstrap = fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
            }
            vim.cmd [[packadd packer.nvim]]
        end
        vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    end

    -- Plugins
    local function plugins(use)

        use { "wbthomason/packer.nvim" }

        -- Load only when require
        use { "nvim-lua/plenary.nvim", module = "plenary" }

        -- Colorscheme
        use {
            "sainnhe/gruvbox-material",
            disable = false,
        }

        use {
            "morhetz/gruvbox",
            disable = false,
        }

        use {
            "ggandor/leap.nvim",
            disable = false,
            config = function()
                require("config.packages.leap").setup()
            end,
        }

        -- Git
        use {
            "tpope/vim-fugitive",
            opt = true,
            cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
            requires = {
                "tpope/vim-rhubarb",
                "idanarye/vim-merginal",
            },
        }

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            opt = false,
            disable = false,
            config = function()
                require("config.packages.telescope").setup()
            end,
            cmd = { "Telescope" },
            module = "telescope",
            keys = { "<leader>f" },
            wants = {
                "plenary.nvim",
                "popup.nvim",
            },
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-file-browser.nvim",
            },
        }

        -- nerdtree
        use {
            'scrooloose/nerdtree'
        }

        -- harpoon
        use {
            "ThePrimeagen/harpoon",
            keys = { [[<leader>h]] },
            module = { "harpoon", "harpoon.cmd-ui", "harpoon.mark", "harpoon.ui", "harpoon.term" },
            wants = { "telescope.nvim" },
            config = function()
                require("config.packages.harpoon").setup()
            end,
        }

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            opt = true,
            event = "BufReadPre",
            run = ":TSUpdate",
            config = function()
                require("config.packages.treesitter").setup()
            end,
        }

        --Autopair
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup()
            end,
        }

        use {
            'VonHeikemen/lsp-zero.nvim',
            config = function()
                require("config.packages.lsp-zero").setup()
            end,
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }

        -- additional ccls features
        use {
            'm-pilia/vim-ccls'
        }

        -- Debugging
        use {
            'mfussenegger/nvim-dap',
            config = function()
                require("config.packages.dap").setup()
            end,
        }

        use {
            'rcarriga/nvim-dap-ui',
            config = function()
                require("config.packages.dap-ui").setup()
            end,
        }

        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }

        use {
            'christoomey/vim-tmux-navigator'
        }

        use {
            'vimwiki/vimwiki',
            config = function()
                require("config.packages.vimwiki").setup()
            end,
            requires = {
                'mattn/calendar-vim',
            }
        }

        use {
            'mhartington/formatter.nvim',
            config = function()
                require("config.packages.formatter").setup()
            end,
        }

        use {
            'ntpeters/vim-better-whitespace'
            -- config = function ()
            --     require('config.packages.whitespace').setup()
            -- end,
        }

        if packer_bootstrap then
            print "Restart Neovim required after installation!"
            require("packer").sync()
        end
    end

    packer_init()

    local packer = require "packer"
    packer.init(conf)
    packer.startup(plugins)
end

return M
