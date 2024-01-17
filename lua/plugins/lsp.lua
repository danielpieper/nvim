return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = {
          settings = {
            ["nil"] = { formatting = { command = { "nixpkgs-fmt" } } },
          },
        },
        intelephense = {
          filetypes = { "php", "blade" },
          init_options = {
            licenceKey = vim.fn.expand("$HOME/.config/intelephense/license.txt"),
            -- clearCache = true
          },
          settings = {
            intelephense = {
              filetypes = { "php", "blade" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
      },
    },
  },
}
