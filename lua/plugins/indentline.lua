vim.g.indentLine_setColors = 0
-- vim.g.indentLine_bgcolor_gui = '#151718'
vim.g.indentLine_char = '┊'
vim.o.list = true
vim.o.listchars = "tab:▏ "
vim.g.indentLine_fileTypeExclude = { 'dashboard' }
vim.g.indentLine_bufTypeExclude = { 'help', 'terminal' }

local indentLineConcealGroup = vim.api.nvim_create_augroup("IndenLineConcealGroup", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter jsonc,json,markdown", {
    command = "silent! :IndentLinesDisable",
    group = indentLineConcealGroup,
})
vim.api.nvim_create_autocmd("InsertLeave jsonc,json,markdown", {
    command = "silent! :IndentLinesEnable",
    group = indentLineConcealGroup,
})
