--settings
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 4
local tabstop = 4
local timeoutlen=600
local updatetime=300

local tab_char=">"
local space_char="␣"

--editor
--autocmd GUIEnter * set visualbell t_vb=
opt('o', 'mouse', 'a')
opt('o', 'number', true)
opt('o', 'ruler', true)
opt('o', 'ls', 2)
opt('o', 'undolevels', 1000)
opt('o', 'history', 1000)
opt('o', 'switchbuf', 'useopen,usetab,split')
opt('o', 'showmode', true)
opt('o', 'hidden', true)
opt('o', 'relativenumber', true)
opt('o', 'exrc', true)

-- netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- color scheme
vim.cmd('colorscheme gruvbox-material')

-- color column
opt('w', 'colorcolumn', '100')

-- split preferences
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)

-- timeouts
opt('o', 'timeout', true)
opt('o', 'timeoutlen', timeoutlen)
opt('o', 'updatetime', updatetime)

-- searching and highlighting
opt('o', 'hlsearch', true)
opt('o', 'incsearch', true)
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)

-- encoding
opt('o', 'enc', 'utf-8')
opt('o', 'fenc','utf-8')
opt('o', 'termguicolors', true)
--
-- indention
opt('b', 'shiftwidth', indent)
opt('b', 'tabstop', tabstop)
opt('b', 'softtabstop', tabstop)
opt('b', 'smartindent', true)
opt('b', 'expandtab', true)
opt('b', 'autoindent', true)
vim.cmd('filetype plugin indent on')

-- listchars
vim.opt.listchars = { space = '_' , tab = '▸ ', eol = '↵', trail = '~' }

-- folding
opt('w', 'foldcolumn', '0')

-- compatibility
opt('o', 'compatible', false)

-- clipboard
vim.cmd('set clipboard+=unnamedplus')
