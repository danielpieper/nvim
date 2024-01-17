local Util = require("lazyvim.util")

return {
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
        width = 60,
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function(_)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 2000,
        ignore_whitespace = true,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "danielpieper/telescope-tmuxinator.nvim", -- https://github.com/danielpieper/telescope-tmuxinator.nvim
        enabled = vim.fn.executable("tmuxinator") == 1,
        config = function()
          Util.on_load("telescope.nvim", function()
            require("telescope").load_extension("tmuxinator")
          end)
        end,
      },
    },
    opts = {
      defaults = {
        layout_config = {
          height = 0.95,
          width = 0.95,
        },
      },
      pickers = {
        lsp_references = { fname_width = 50 },
        lsp_incoming_calls = { fname_width = 50 },
        lsp_outgoing_calls = { fname_width = 50 },
        lsp_definitions = { fname_width = 50 },
        lsp_type_definitions = { fname_width = 50 },
        lsp_implementations = { fname_width = 50 },
        lsp_document_symbols = { fname_width = 50 },
        lsp_workspace_symbols = { fname_width = 50 },
      },
      extensions = {
        tmuxinator = {
          select_action = "switch", -- | 'stop' | 'kill'
          stop_action = "stop", -- | 'kill'
          disable_icons = false,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>fp", function() require("telescope").extensions.tmuxinator.projects(require("telescope.themes").get_dropdown({})) end, desc = "Tmuxinator Projects" },
    },
  },
  {
    -- Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua! Vim splits on steroids.
    "nvim-focus/focus.nvim", -- https://github.com/nvim-focus/focus.nvim
    main = "focus",
    config = function(_, opts)
      local ignore_filetypes = { "neo-tree" }
      local ignore_buftypes = { "nofile", "prompt", "popup", "quickfix" }

      local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

      require("focus").setup(opts)

      vim.api.nvim_create_autocmd("WinEnter", {
        group = augroup,
        callback = function(_)
          if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
            vim.w.focus_disable = true
          else
            vim.w.focus_disable = false
          end
        end,
        desc = "Disable focus autoresize for BufType",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        callback = function(_)
          if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.focus_disable = true
          else
            vim.b.focus_disable = false
          end
        end,
        desc = "Disable focus autoresize for FileType",
      })
    end,
    opts = {
      enable = true,
      commands = false,
      ui = {
        signcolumn = false,
      },
    },
  },
  {
    -- A lua neovim plugin to generate shareable file permalinks
    "linrongbin16/gitlinker.nvim", -- https://github.com/linrongbin16/gitlinker.nvim
    name = "gitlinker",
    config = function()
      require("gitlinker").setup({
        router = {
          browse = {
            ["^gitlab%.personio%-internal%.de"] = require("gitlinker.routers").gitlab_browse,
          },
          blame = {
            ["^gitlab%.personio%-internal%.de"] = require("gitlinker.routers").gitlab_blame,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>glo",
        "<cmd>GitLink!<cr>",
        desc = "open git repo url in browser",
        silent = true,
        noremap = true,
      },
      {
        "<leader>glo",
        "<cmd>GitLink!<cr>",
        desc = "open git repo url",
        mode = "v",
        silent = true,
        noremap = true,
      },
      {
        "<leader>gly",
        "<cmd>GitLink<cr>",
        desc = "copy git repo url to clipboard",
        silent = true,
        noremap = true,
      },
      {
        "<leader>gly",
        "<cmd>GitLink<cr>",
        desc = "copy git repo url to clipboard",
        mode = "v",
        silent = true,
        noremap = true,
      },
      {
        "<leader>glb",
        "<cmd>GitLink blame<cr>",
        desc = "copy git blame repo url to clipboard",
        silent = true,
        noremap = true,
      },
      {
        "<leader>glb",
        "<cmd>GitLink blame<cr>",
        desc = "copy git blame repo url to clipboard",
        mode = "v",
        silent = true,
        noremap = true,
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>gl"] = { name = "+repo link" },
      },
    },
  },
}
