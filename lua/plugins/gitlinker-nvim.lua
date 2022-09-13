local gitlinker = require("gitlinker")
local utils = require("utils")

gitlinker.setup({
	mappings = nil,
})

vim.keymap.set('n', '<Leader>Gb', ':GitBlameToggle<cr>', { silent = true })

if utils.isModuleAvailable("which-key") then
  require("which-key").register({
    G = {
      name = "git",
      G = "Copy git repo url",
    },
  }, { prefix = "<leader>" })
end
