local M = {}

function M.setup()

    require("telekasten").setup {
      home = vim.fn.expand("~/tools/zettelkasten"),
    }

end

return M
