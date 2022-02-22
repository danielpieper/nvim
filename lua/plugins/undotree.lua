local map = require("utils").map
local g = vim.g

-- see https://github.com/mbbill/undotree/blob/master/plugin/undotree.vim#L15 for list of options
g.undotree_SplitWidth = 45
g.undotree_WindowLayout = 4
-- g.undotree_DiffpanelHeight = 10

map("n", "<F4>", ":UndotreeToggle<CR>", {silent = true})
