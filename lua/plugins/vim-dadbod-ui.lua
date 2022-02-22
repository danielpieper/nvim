local g = vim.g
local map = require("utils").wkmap

map("n", "<F5>", ":DBUIToggle<CR>", 'Open database drawer', {silent = true})
map("n", "<Leader><F5>", ":DBUILastQueryInfo<CR>", 'Last database query results', {silent = true})

g.db_ui_use_nerd_fonts = 1
g.db_ui_execute_on_save = 0

