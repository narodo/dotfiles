local M = {}

function M.setup()

    require("dapui").setup();

    local dap = require("dap");

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/OpenDebugAD7",

    }

    dap.configurations.cppdbg = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspacseFolder}',
        stopAtEntry = true,
      },
      {
        name = 'gdbserver',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:3333',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
      },
    }

    dap.configurations.c = dap.configurations.cppdbg
    dap.configurations.cpp = dap.configurations.cppdg
    dap.configurations.rust = dap.configurations.cppdbg

end

return M