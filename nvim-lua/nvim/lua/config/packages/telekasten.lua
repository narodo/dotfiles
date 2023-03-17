local M = {}

function M.setup()

    require("telekasten").setup {
        home = "~/tools/zettelbox/work/",
        vaults = {
            personal = {
                home = "~/tools/zettelbox/personal/",
            }
        }
    }

end

return M
