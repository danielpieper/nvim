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
  },
	icons = {
		child_indent = "│",
		child_prefix = "├",
		collapsed = "─",
		expanded = "╮",
		failed = "✖",
		final_child_indent = " ",
		final_child_prefix = "╰",
		non_collapsible = "─",
		passed = "✔",
		running = "",
		running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
		skipped = "ﰸ",
		unknown = "?"
	},
})

vim.keymap.set('n', '<Leader>tt', function () return require("neotest").run.run() end, { silent = true })
vim.keymap.set('n', '<Leader>tf', function () return require("neotest").run.run(vim.fn.expand("%")) end, { silent = true})
vim.keymap.set('n', '<Leader>ta', function () return require("neotest").run.attach() end, { silent = true})
vim.keymap.set('n', '<Leader>td', function () return require("neotest").run.run({ strategy = "dap"}) end, { silent = true})
vim.keymap.set('n', '<Leader>ts', function () return require("neotest").summary.toggle() end, { silent = true})

if utils.isModuleAvailable("which-key") then
  require("which-key").register({
    t = {
      name = "run tests",
      t = "Run nearest test",
      f = "Run tests in file",
      a = "Attach to the nearest test",
      d = "Debug the nearest test",
      s = "Toggle summary window",
    },
  }, { prefix = "<leader>" })
end

-- make test commands execute using dispatch.vim
vim.api.nvim_set_var('test#strategy', 'dispatch_background')
