local M = {}

function M.setup()

    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require("formatter").setup {
      filetype = {
        cpp = {
          require("formatter.filetypes.cpp").clangformat,
        };
        c = {
          require("formatter.filetypes.c").clangformat,
        };
      };
    }

end

return M
