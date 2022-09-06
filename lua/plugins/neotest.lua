local utils = require("utils")

-- get neotest namespace (api call creates or returns namespace)
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message = diagnostic.message
      :gsub("\n", " ")
      :gsub("\t", " ")
      :gsub("%s+", " ")
      :gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

require("neotest").setup({
  adapters = {
    require('neotest-go'),
    require("neotest-vim-test")({ allow_file_types = { "php" } }),
  }
})

vim.keymap.set('n', '<Leader>tt', function () return require("neotest").run.run() end, { silent = true })
vim.keymap.set('n', '<Leader>tf', function () return require("neotest").run.run(vim.fn.expand("%")) end, { silent = true})
vim.keymap.set('n', '<Leader>ts', function () return require("neotest").run.stop() end, { silent = true})
vim.keymap.set('n', '<Leader>ta', function () return require("neotest").run.attach() end, { silent = true})
vim.keymap.set('n', '<Leader>td', function () return require("neotest").run.run({ strategy = "dap"}) end, { silent = true})

if utils.isModuleAvailable("which-key") then
  require("which-key").register({
    t = {
      name = "run tests",
      t = "Run nearest test",
      f = "Run tests in file",
      s = "Stop the nearest test",
      a = "Attach to the nearest test",
      d = "Debug the nearest test",
    },
  }, { prefix = "<leader>" })
end

-- make test commands execute using dispatch.vim
vim.api.nvim_set_var('test#strategy', 'dispatch_background')
