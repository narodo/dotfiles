return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    opts = {
        -- icons = { expanded = "?", collapsed = "?" },
        mappings = {
            -- Use a table to apply multiple mappings
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
        },
        layouts = {
            {
                elements = {
                    { id = "scopes",      size = 0.25 },
                    { id = "breakpoints", size = 0.20 },
                    { id = "stacks",      size = 0.25 },
                    { id = "disassembly", size = 0.30 },
                },
                size = 80,
                position = 'right',
            },
            {
                elements = { 'repl' },
                size = 10,
                position = 'bottom',
            },
        },
        floating = {
            max_height = nil,     -- These can be integers or a float between 0 and 1.
            max_width = nil,      -- Floats will be treated as percentage of your screen.
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        windows = { indent = 1 },
    },

    config = function(_, opts)
        require("dapui").setup(opts)
    end
}
