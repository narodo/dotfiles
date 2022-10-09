local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
local o = vim.o
local cmd = vim.cmd

cmd "highlight StatusLeft guifg=red guibg=#32344a"
cmd "highlight StatusMid guifg=green guibg=#32344a"
cmd "highlight StatusRight guifg=blue guibg=#32344a"
--
-- Statusline 
o.statusline = ""
o.statusline = o.statusline .. "[%n]"
o.statusline = o.statusline .. " %<%F"
o.statusline = o.statusline .. "%m"
o.statusline = o.statusline .. "%="
o.statusline = o.statusline .. "%#CursorColumn#"
o.statusline = o.statusline .. " %y"
o.statusline = o.statusline .. " %{&fileencoding?&fileencoding:&encoding}"
o.statusline = o.statusline .. "[%{&fileformat}]"
o.statusline = o.statusline .. " %p%%"
o.statusline = o.statusline .. " %l:%v(%c)"
o.statusline = o.statusline .. "[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}] "
