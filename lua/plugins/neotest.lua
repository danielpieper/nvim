local utils = require("utils")

require("neotest").setup({
  adapters = {
    require("neotest-vim-test"),
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
