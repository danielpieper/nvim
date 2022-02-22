local map = require("utils").wkmap

map('n', '<Leader>tt', ':TestNearest<CR>', 'Test nearest', {silent = true})
map('n', '<Leader>tf', ':TestFile<CR>', 'Test file', {silent = true})
map('n', '<Leader>ts', ':TestSuite<CR>', 'Test suite', {silent = true})
map('n', '<Leader>tl', ':TestLast<CR>', 'Test last', {silent = true})
map('n', '<Leader><Leader>tt', ':TestNearest -strategy=dispatch<CR>', 'Test nearest w/ results', {silent = true})
map('n', '<Leader><Leader>tf', ':TestFile -strategy=dispatch<CR>', 'Test file w/ results', {silent = true})
map('n', '<Leader><Leader>ts', ':TestSuite -strategy=dispatch<CR>', 'Test suite w/ results', {silent = true})
map('n', '<Leader><Leader>tl', ':TestLast -strategy=dispatch<CR>', 'Test last w/ results', {silent = true})
map('n', '<Leader>tv', ':TestVisit<CR>', 'Jump to last test', {silent = true})

-- make test commands execute using dispatch.vim
vim.api.nvim_set_var('test#strategy', 'dispatch_background')
