-- *****************************************
-- Testing & debugging
-- *****************************************
return {
    {
        -- An extensible framework for interacting with tests within NeoVim.
        'https://github.com/rcarriga/neotest',
        dependencies = {
            'https://github.com/nvim-lua/plenary.nvim', -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
            'https://github.com/nvim-treesitter/nvim-treesitter', -- Nvim Treesitter configurations and abstraction layer
            -- 'https://github.com/antoinemadec/FixCursorHold.nvim', -- Fix CursorHold Performance.
            'https://github.com/nvim-neotest/neotest-go', -- This plugin provides a go(lang) adapter for the Neotest framework.
        },
        config = function()
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
        end,
        keys = {
            {
                '<Leader>tt',
                function() return require("neotest").run.run() end,
                desc = "Run nearest test", silent = true,
            },
            {
                '<Leader>tf',
                function() return require("neotest").run.run(vim.fn.expand("%")) end,
                desc = "Run tests in file", silent = true
            },
            {
                '<Leader>ta',
                function() return require("neotest").run.attach() end, desc = "Attach to the nearest test",
                silent = true,
            },
            {
                '<Leader>td',
                function() return require("neotest").run.run({ strategy = "dap" }) end,
                desc = "Debug the nearest test", silent = true,
            },
            {
                '<Leader>ts',
                function() return require("neotest").summary.toggle() end, desc = "Toggle summary window",
                silent = true,
            },
        },
    },
}
