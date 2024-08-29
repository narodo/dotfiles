return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require("dap");
        dap.defaults.fallback.switchbuf = 'uselast';

        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/OpenDebugAD7",
        }

        dap.adapters.codelldb = {
            id = 'codelldb',
            type = 'server',
            host = '127.0.0.1',
            port = 13000
        }

        dap.configurations.cppdbg = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                -- program = function()
                --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                -- end,
                cwd = '${workspacseFolder}',
                stopAtEntry = true,
            },
            {
                name = 'gdbserver',
                type = 'cppdbg',
                request = 'launch',
                MIMode = 'gdb',
                cwd = '${workspaceFolder}',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
            },
        }

        dap.configurations.codelldb = {
            {
                name = "Remote lldb ",
                type = "codelldb",
                request = "launch",
                -- program = function()
                --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                -- end,
                cwd = '${workspacseFolder}',
                stopAtEntry = true,
            },
        }

        -- dap.configurations.c = dap.configurations.cppdbg
        -- dap.configurations.cpp = dap.configurations.cppdbg
        -- dap.configurations.rust = dap.configurations.cppdbg

        dap.configurations.c = dap.configurations.codelldb
        dap.configurations.cpp = dap.configurations.codelldb
        dap.configurations.rust = dap.configurations.codelldb
    end,
}
