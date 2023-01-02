local null_ls = require("null-ls")
local is_work = require("utils").is_work

local sources = {
    -- null_ls.builtins.formatting.stylua, -- A fast and opinionated Lua formatter written in Rust.
    -- null_ls.builtins.formatting.gofumpt, -- Enforce a stricter format than gofmt, while being backwards compatible.
    null_ls.builtins.diagnostics.eslint, -- Fixes problems in your JavaScript code.

    null_ls.builtins.completion.spell.with({
        filetypes = { "gitcommit", "markdown" },
    }), -- Spell suggestions completion source.

    null_ls.builtins.diagnostics.phpcs.with({
        condition = function(utils)
            return utils.root_has_file({ "phpcs.xml.dist", "phpcs.xml" })
        end,
    }), -- PHP_CodeSniffer is a script that tokenizes PHP, JavaScript and CSS files to detect violations of a defined coding standard.

    null_ls.builtins.diagnostics.phpstan.with({
        extra_args = { "--memory-limit", "4G" },
        timeout = 60000,
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }), -- PHP static analysis tool.
}

if is_work then
    table.insert(
        sources,
        null_ls.builtins.diagnostics.golangci_lint.with({
            args = {
                "run",
                "--disable-all",
                "--enable govet,unused,gofmt,goimports,ineffassign,misspell,unconvert,revive,rowserrcheck,sqlclosecheck,bodyclose,staticcheck,exhaustive,gomodguard,depguard,exportloopref,errname,lll",
                "--deadline 5m",
                "--out-format json",
                "$DIRNAME",
                "--path-prefix",
                "$ROOT",
            },
        })
    ) -- A Go linter aggregator.
else
    table.insert(
        sources,
        null_ls.builtins.diagnostics.golangci_lint.with({
            args = {
                "run",
                "--enable-all",
                "--disable exhaustivestruct",
                "--out-format json",
                "$DIRNAME",
                "--path-prefix",
                "$ROOT",
            },
        })
    ) -- A Go linter aggregator.
end

null_ls.setup({
    -- debug = true,
    diagnostics_format = "#{m} (#{s})",
    sources = sources,
})
