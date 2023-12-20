-- *****************************************
-- Database
-- *****************************************
return {
  {
    -- Simple UI for vim-dadbod. It allows simple navigation through databases and allows saving queries for later use.
    "kristijanhusak/vim-dadbod-ui", -- https://github.com/kristijanhusak/vim-dadbod-ui
    dependencies = {
      "tpope/vim-dadbod", -- Dadbod is a Vim plugin for interacting with databases.
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIRenameBuffer", "DBUIFindBuffer", "DBUILastQueryInfo" },
    config = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_execute_on_save = 0
    end,
    keys = {
      { "<Leader>D", ":DBUIToggle<CR>", desc = "Open database drawer", silent = true },
    },
  },
  {
    -- Database auto completion powered by vim-dadbod.
    "kristijanhusak/vim-dadbod-completion", -- https://github.com/kristijanhusak/vim-dadbod-completion
    dependencies = {
      "tpope/vim-dadbod", -- Dadbod is a Vim plugin for interacting with databases.
      "hrsh7th/nvim-cmp", -- A completion plugin for neovim coded in Lua.
    },
    ft = { "sql", "mysql" },
    config = function()
      local augroup = vim.api.nvim_create_augroup("DadbodCompletion", {})
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        pattern = "sql,mysql,plsql",
        callback = function()
          require("cmp").setup.buffer({
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "luasnip" },
              { name = "buffer" },
              { name = "calc" },
            },
          })
        end,
      })
    end,
  },
}
