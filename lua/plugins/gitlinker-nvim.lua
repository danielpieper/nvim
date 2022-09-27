local gitlinker = require("gitlinker")
local utils = require("utils")

gitlinker.setup({
	mappings = nil,
})

vim.keymap.set('n', '<leader>GG', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
vim.keymap.set('v', '<leader>GG', '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {})

if utils.isModuleAvailable("which-key") then
  require("which-key").register({
    G = {
      name = "Git",
      G = "Open git repo url",
    },
  }, { prefix = "<leader>" })
end
