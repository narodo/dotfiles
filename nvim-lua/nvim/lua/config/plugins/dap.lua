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
            port = 13000,
            executable = {
                command = "codelldb",
                args = { "--port", "13000" },
            }
        }

        dap.adapters.gdbserver = {
            id = 'gdbserver',
            type = 'server',
            host = '127.0.0.1',
            port = 3333,
        }

        dap.configurations.cppdbg = {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",
            -- program = function()
            --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            -- end,
            cwd = '${workspacseFolder}',
            stopAtEntry = true,
        }

        dap.configurations.gdbserver = {
            name = "gdbServer",
            type = "gdbserver",
            request = "launch",
            MIMode = 'gdb',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspacseFolder}',
            stopAtEntry = true,
        }

        dap.configurations.codelldb = {
            name = "Remote lldb ",
            type = "codelldb",
            request = "launch",
            -- program = function()
            --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            -- end,
            cwd = '${workspacseFolder}',
            stopAtEntry = true,
        }

        -- Create provide that allows us to load a vscode type json file
        dap.providers.configs["pickConfig"] = function(bufnr)
            local cfg = {}
            vim.ui.select({ 'debugJson', 'default' }, {
                prompt = 'Config from'
            }, function(choice)
                if choice == 'debugJson' then
                    path = vim.fn.input('Path to debug config json: ',
                        os.getenv("HOME") .. '/tools/dotfiles/debug-configs' .. '/', 'file')
                    local ok, configs = pcall(require("dap.ext.vscode").getconfigs, path)
                    if not ok then
                        local msg = "Can't get configurations from json file:\n%s" .. path
                        vim.notify_once(msg, vim.log.levels.WARN, { title = "DAP" })
                        cfg = {}
                        return
                    else
                        cfg = vim.deepcopy(configs)
                    end
                else
                    cfg = {}
                end
            end)
            return cfg
        end

        dap.configurations.c = { dap.configurations.codelldb, dap.configurations.gdbserver }
        dap.configurations.cpp = { dap.configurations.codelldb, dap.configurations.gdbserver }
        dap.configurations.rust = dap.configurations.codelldb
    end,
}
