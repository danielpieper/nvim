local utils = require("utils")

vim.g.gitblame_ignored_filetypes = { "NvimTree" }

vim.keymap.set('n', '<Leader>Gb', ':GitBlameToggle<cr>', { silent = true })

if utils.isModuleAvailable("which-key") then
  require("which-key").register({
    G = {
      name = "git",
      b = "Toggle git blame",
    },
  }, { prefix = "<leader>" })
end
