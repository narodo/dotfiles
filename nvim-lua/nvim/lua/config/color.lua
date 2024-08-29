local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
--
-- color scheme
vim.cmd('colorscheme gruvbox-material')
-- color column
opt('w', 'colorcolumn', '100')
