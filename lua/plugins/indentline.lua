vim.g.indentLine_setColors = 0
-- vim.g.indentLine_bgcolor_gui = '#151718'
vim.g.indentLine_char = '┊'
vim.o.list = true
vim.o.listchars = "tab:▏ "
vim.g.indentLine_fileTypeExclude = { 'dashboard' }
vim.g.indentLine_bufTypeExclude = { 'help', 'terminal' }

local jsonConcealGroup = vim.api.nvim_create_augroup("JsonConcealGroup", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter jsonc,json", {
  command = "silent! :IndentLinesDisable",
  group = jsonConcealGroup,
})
vim.api.nvim_create_autocmd("InsertLeave jsonc,json", {
  command = "silent! :IndentLinesEnable",
  group = jsonConcealGroup,
})
