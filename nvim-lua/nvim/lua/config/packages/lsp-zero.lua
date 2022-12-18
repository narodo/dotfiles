local M = {}


function M.setup()

    local lsp = require('lsp-zero')

    lsp.preset('recommended')

    lsp.configure('ccls', {
      force_setup = true,
      init_options = {
        highlight = {
          lsRanges = true,
        },
      },
      on_attach = function()
      end,
    })

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = false,
      float = true,
    })


end
return M
