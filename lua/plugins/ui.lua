return {
  {
    -- Smooth scrolling for Vim done right🥤
    "psliwka/vim-smoothie", -- https://github.com/psliwka/vim-smoothie
    enabled = true,
  },
  {
    -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
    "norcalli/nvim-colorizer.lua", -- https://github.com/norcalli/nvim-colorizer.lua
    name = "colorizer",
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
    },
    keys = {
      -- keys collide with move cursor high/low
      { "<S-h>", false },
      { "<S-l>", false },
      -- Switch from Other buffer is changed to <leader>bn
      { "<leader>bb", "<Cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
    },
  },
}
