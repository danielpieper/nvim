local whichkey = require('which-key')

whichkey.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

-- packer.nvim plugin loading keys:
whichkey.register({
  ["<F5>"] = { 'Open database drawer' },
  ["<Leader><F5>"] = { 'Last database query results' },
  ["<Leader>t"] = {
    name = "+test",
    ["t"] = { "Test nearest" },
    ["f"] = { "Test file" },
    ["s"] = { "Test suite" },
    ["l"] = { "Test last" },
    ["v"] = { "Jump to last test" },
  },
  ["<Leader>tt"] = {
    name = "+test",
    ["t"] = { "Test nearest w/ results" },
    ["f"] = { "Test file w/ results" },
    ["s"] = { "Test suite w/ results" },
    ["l"] = { "Test last w/ results" },
  },
  ["<F4>"] = { 'Open undo drawer' },
})
