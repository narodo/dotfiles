local Path = require "plenary.path"
vim.api.nvim_create_user_command('CustomNvimTreeOpen',
    function()
        vim.ui.input({ prompt = 'Path: ', completion = "file" },
            function(input)
                local newPath = Path:new(input)
                local path = Path.expand(newPath)
                -- if nvim-tree is open already it does not reliably update the root node
                -- to workaround this we close it first
                require("nvim-tree.api").tree.close()
                require("nvim-tree.api").tree.open({ path = path, update_root = true })
            end
        )
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command('CustomNvimTreeFind',
    function()
        local path = vim.fn.expand('%:p:h')
        require("nvim-tree.api").tree.close()
        require("nvim-tree.api").tree.open({ path = path, update_root = true })
    end,
    { nargs = 0 }
)

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', 'P',
        function()
            local current = require("nvim-tree.api").tree.get_node_under_cursor()
            print(current.type)
            if current.type == nil then
                print("Not a valid node")
                return
            end
            if current.type == "file" then
                current = current.parent
            end
            print("Change dir to", current.absolute_path)
            vim.api.nvim_set_current_dir(current.absolute_path)
        end,
        opts('Change vim directory to node dir')
    )
end


return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup(
            {
                on_attach = my_on_attach,
                git = {
                    enable = false,
                },
                renderer = {
                    icons = {
                        web_devicons = {
                            file = {
                                enable = false,
                                color = false,
                            },
                            folder = {
                                enable = false,
                                color = false,
                            },
                        },
                        show = {
                            file = false,
                            folder = false,
                            folder_arrow = true,
                            git = false,
                            modified = false,
                            hidden = false,
                            diagnostics = false,
                            bookmarks = false,
                        },
                        glyphs = {
                            default = "",
                            symlink = "",
                            bookmark = "󰆤",
                            modified = "●",
                            hidden = "󰜌",
                            folder = {
                                arrow_closed = "▸",
                                arrow_open = "▾",
                                default = "",
                            },
                        },
                    },
                }
            }
        )
    end
}
