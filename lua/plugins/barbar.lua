-- *****************************************
-- Buffers
-- *****************************************
return {
    {
        -- Tabs, as understood by any other editor.
        "https://github.com/romgrk/barbar.nvim",
        name = "bufferline",
        lazy = false,
        dependencies = {
            'https://github.com/nvim-tree/nvim-web-devicons' -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
        },
        opts = {
            icons = {
                -- Configure the base icons on the bufferline.
                buffer_index = false,
                buffer_number = false,
                button = false,
                -- Enables / disables diagnostic symbols
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = { enabled = true, icon = ' ' },
                    [vim.diagnostic.severity.WARN] = { enabled = false },
                    [vim.diagnostic.severity.INFO] = { enabled = false },
                    [vim.diagnostic.severity.HINT] = { enabled = false },
                },
                filetype = {
                    -- Sets the icon's highlight group.
                    -- If false, will use nvim-web-devicons colors
                    custom_colors = false,

                    -- Requires `nvim-web-devicons` if `true`
                    enabled = true,
                },
                separator = { left = '▎', right = '' },

                -- Configure the icons on the bufferline when modified or pinned.
                -- Supports all the base icon options.
                -- modified = { button = '●' },

                -- Configure the icons on the bufferline based on the visibility of a buffer.
                -- Supports all the base icon options, plus `modified` and `pinned`.
                alternate = { filetype = { enabled = false } },
                -- current = { buffer_index = true },
                -- inactive = { button = '×' },
                visible = { modified = { buffer_number = false } },
            },

            -- Sets the maximum padding width with which to surround each tab
            maximum_padding = 0,

            -- Sets the maximum buffer name length.
            maximum_length = 40,
        },
        keys = {
            -- Magic buffer-picking mode
            { '<leader>bb', '<cmd>BufferPick<cr>',           desc = 'Pick Buffer',                   silent = true },
            -- Move to previous/next
            { '[b',         ":BufferPrevious<CR>",           desc = 'Previous Buffer',               silent = true },
            { ']b',         ":BufferNext<CR>",               desc = 'Next Buffer',                   silent = true },

            -- Re-order to previous/next
            { '<Leader>b<', ":BufferMovePrevious<CR>",       desc = 'Move Buffer left',              silent = true },
            { '<Leader>b>', ":BufferMoveNext<CR>",           desc = 'Move Buffer right',             silent = true },

            -- Goto buffer in position...
            { '<Leader>1',  ":BufferGoto 1<CR>",             desc = 'Jump to Buffer 1',              silent = true },
            { '<Leader>2',  ":BufferGoto 2<CR>",             desc = 'Jump to Buffer 2',              silent = true },
            { '<Leader>3',  ":BufferGoto 3<CR>",             desc = 'Jump to Buffer 3',              silent = true },
            { '<Leader>4',  ":BufferGoto 4<CR>",             desc = 'Jump to Buffer 4',              silent = true },
            { '<Leader>5',  ":BufferGoto 5<CR>",             desc = 'Jump to Buffer 5',              silent = true },
            { '<Leader>6',  ":BufferGoto 6<CR>",             desc = 'Jump to Buffer 6',              silent = true },
            { '<Leader>7',  ":BufferGoto 7<CR>",             desc = 'Jump to Buffer 7',              silent = true },
            { '<Leader>8',  ":BufferGoto 8<CR>",             desc = 'Jump to Buffer 8',              silent = true },
            { '<Leader>9',  ":BufferLast<CR>",               desc = 'Jump to last Buffer',           silent = true },
            { '<Leader>p',  ":BufferPin<CR>",                desc = 'Pin Buffer',                    silent = true },

            -- Close buffer
            { '<Leader>q',  ":BufferClose<CR>",              desc = 'Close Buffer',                  silent = true },

            -- " Wipeout buffer
            { '<Leader>Q',  ":BufferWipeout<CR>",            desc = 'Wipe Buffer',                   silent = true },
            { 'Q',          ":BufferCloseAllButCurrent<CR>", desc = 'Close all Buffers but current', silent = true },
            { 'QP',         ":BufferCloseAllButPinned<CR>",  desc = 'Close all Buffers but pinned',  silent = true },
            { 'Q>',         ":BufferCloseBuffersRight<CR>",  desc = 'Close all Buffers right',       silent = true },
            { 'Q<',         ":BufferCloseBuffersLeft<CR>",   desc = 'Close all Buffers left',        silent = true },
        },
    },
}
