local null_ls = require("null-ls")

null_ls.setup({
  diagnostics_format = "#{m} (#{s})",
  sources = {
    null_ls.builtins.formatting.stylua, -- A fast and opinionated Lua formatter written in Rust.
    null_ls.builtins.formatting.gofumpt, -- Enforce a stricter format than gofmt, while being backwards compatible.

    null_ls.builtins.completion.spell, -- Spell suggestions completion source.

    null_ls.builtins.diagnostics.eslint, -- Fixes problems in your JavaScript code.
    null_ls.builtins.diagnostics.phpcs, -- PHP_CodeSniffer is a script that tokenizes PHP, JavaScript and CSS files to detect violations of a defined coding standard.
    null_ls.builtins.diagnostics.phpstan.with({
      extra_args = { "--memory-limit", "4G" },
    }), -- PHP static analysis tool.
    null_ls.builtins.diagnostics.golangci_lint, -- A Go linter aggregator.
    null_ls.builtins.diagnostics.ansiblelint, -- Linter for Ansible playbooks, roles and collections.
  },
})
