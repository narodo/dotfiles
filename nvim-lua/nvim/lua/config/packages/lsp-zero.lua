local M = {}

function M.setup()

    local lsp = require('lsp-zero')

    lsp.preset('recommended')

    lsp.configure('ccls', {
      force_setup = true,
      init_options = {
        compilationDatabaseDirectory = "build";
        highlight = {
          lsRanges = true,
        };
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

    -- CCLS skip region highlighting
    local ns = vim.api.nvim_create_namespace('ccls-skip-region')
    vim.lsp.handlers["$ccls/publishSkippedRanges"] = function(_, result,_ , _)
        if not result then
            return
        else
            local skipped_ranges = result["skippedRanges"]
            vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
            for _ , data in pairs(skipped_ranges) do
                --
                -- get lines of each range 
                -- adjust lines so that #if and #endif are not commented out
                local start_line=data['start']['line'] +1
                local end_line=data['end']['line'] -1

                for i =  start_line,end_line, 1 do
                    vim.api.nvim_buf_add_highlight(0, ns, 'Comment', i, 0, -1) --line(i))
                end
            end
        end
    end

end
return M
