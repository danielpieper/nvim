local utils = require("utils")

function _G.enable_vim_dadbod_completion()
  require('cmp').setup.buffer({
    sources = {
      { name = 'vim-dadbod-completion' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'calc' },
    },
  })
end

utils.augroup(
  'vim-dadbod-completion',
  function ()
    vim.cmd([[autocmd FileType sql,mysql,plsql lua enable_vim_dadbod_completion()]])
  end
)
