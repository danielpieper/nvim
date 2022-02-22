local wkmap = require("utils").wkmap

-- Save file
wkmap("n", "<CR>", ":wa<CR>", "Save buffer", {silent = true})

-- Better indenting
wkmap("v", "<", "<gv", "Indent left", {})
wkmap("v", ">", ">gv", "Indent right", {})

-- clear all the highlighted text from the previous search
wkmap("n", "<F2>", ":noh<CR>", "Clear search highlight", {silent = true})

-- Easier Moving between splits
wkmap("n", "<C-J>", "<C-W><C-J>", "Move to below split", {})
wkmap("n", "<C-K>", "<C-W><C-K>", "Move to above split", {})
wkmap("n", "<C-L>", "<C-W><C-L>", "Move to right split", {})
wkmap("n", "<C-H>", "<C-W><C-H>", "Move to left split", {})

-- Split
wkmap("n", "<Leader>x", ":split<CR>", "Split horizontally", {silent = true})
wkmap("n", "<Leader>v", ":vsplit<CR>", "Split vertically", {silent = true})

-- Resize splits
wkmap("n", "<Up>", ":exe 'resize ' . (winheight(0) * 3/2)<CR>", "Resize split up", {silent = true})
wkmap("n", "<Down>", ":exe 'resize ' . (winheight(0) * 2/3)<CR>", "Resize split down", {silent = true})
wkmap("n", "<Right>", ":exe 'vertical resize ' . (winwidth(0) * 3/2)<CR>", "Resize split right", {silent = true})
wkmap("n", "<Left>", ":exe 'vertical resize ' . (winwidth(0) * 2/3)<CR>", "Resize split left", {silent = true})

-- close all windows
wkmap("n", "ZZ", ":qa<CR>", "quit closing all windows", {silent=true})

-- Copy git repo url to file and marked text
wkmap("n", "<Leader>G", ":GBrowse!<CR>", "Copy git repo url", {silent=true})
wkmap("v", "<Leader>G", ":GBrowse!<CR>", "Copy git repo url for lines", {silent=true})

