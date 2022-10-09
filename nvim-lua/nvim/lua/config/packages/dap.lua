local M = {}

function M.setup()

    require("dapui").setup();

    local dap = require("dap");
    --dap.adapters.codelldb = {
      --type = 'server',
      --host = '127.0.0.1',
      --port = 13000 -- 💀 Use the port printed out or specified with `--port`
    --}

    local dap = require('dap')
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/naro/.config/nvim-beginner/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',

    }


    local dap = require('dap')
    dap.configurations.cppdbg = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
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
    dap.configurations.cpp = dap.configurations.cppdbg
    dap.configurations.rust = dap.configurations.cppdbg

end

return M
