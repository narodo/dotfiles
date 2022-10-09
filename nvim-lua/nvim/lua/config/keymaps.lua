function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader 
vim.g.mapleader = " "

-- use jj instead of ESC
map('i', 'jj', '<ESC>')

-- buffers
map('n', '<leader>j', ':b#<CR>')
map('n', '<leader>c', ':close<CR>')

--paste clipboard
map('n', 'pp', '"*p')

-- navigate splits with CTRL + h/j/k/l
map('n', '<C-j>', '<C-W><C-j>')
map('n', '<C-k>', '<C-W><C-k>')
map('n', '<C-h>', '<C-W><C-h>')
map('n', '<C-l>', '<C-W><C-l>')

-- resize pane
map('n', '<C-Down>'  , '<C-W>-')
map('n', '<C-Up>'    , '<C-W>+')
map('n', '<C-Left>'  , '<C-W>>')
map('n', '<C-Right>' , '<C-W><')

-- navigate quickfix
map('n', '<C-n>', ':cnext<CR>')
map('n', '<C-p>', ':cprev<CR>')

-- highlighting
map('n', '//', ':nohl<CR>')

-- Telescope 
map('n', '<leader>ff', '<cmd> Telescope find_files<CR>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fj', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>fq', '<cmd>Telescope quickfix<cr>')

-- NnvimTree 
map('n', '<leader>n', '<cmd>NvimTreeToggle <cr>')

-- Harpoon
map('n', '<leader>ha',  ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<leader>hm',  ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<leader>h1',  ':lua require("harpoon.ui").nav_file(1)<CR>')
map('n', '<leader>h2',  ':lua require("harpoon.ui").nav_file(2)<CR>')
map('n', '<leader>h3',  ':lua require("harpoon.ui").nav_file(3)<CR>')
map('n', '<leader>h4',  ':lua require("harpoon.ui").nav_file(4)<CR>')

-- Map CTRl-Q CTRL-Q to exit terminal mode
map('t', '<C-q><C-q>', '<C-\\><C-n>')

-- DAP
map('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>')
map('n', '<leader>dl', ':lua require("dap").run_last()<CR>')
map('n', '<leader>dt', ':lua require("dap").terminate()<CR>')
map('n', '<F9>', ':lua require("dap").continue()<CR>')
map('n', '<F10>', ':lua require("dap").step_into()<CR>')
map('n', '<F11>', ':lua require("dap").step_out()<CR>')
map('n', '<F12>', ':lua require("dap").step_over()<CR>')

vim.keymap.set('n', '<leader>dj', 
    function()
        path = vim.fn.input('Path to json: ', vim.fn.getcwd() .. '/', 'file')
        require("dap.ext.vscode").load_launchjs(path)
    end
)

-- DAP UI
map('n', '<leader>du', ':lua require("dapui").toggle()<CR>')


-- Nerdtree
map('n', '<leader>n', ':NERDTreeToggle<CR>')
map('n', '<leader>r', ':NERDTreeFind<CR>')


