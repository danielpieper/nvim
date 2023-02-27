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
            -- Enable/disable animations
            animation = true,

            -- Enable/disable icons
            -- if set to 'numbers', will show buffer index in the tabline
            -- if set to 'both', will show buffer index and icons in the tabline
            -- icons = 'both',
            icons = true,

            -- If set, the icon color will follow its corresponding buffer
            -- highlight group. By default, the Buffer*Icon group is linked to the
            -- Buffer* group (see Highlighting below). Otherwise, it will take its
            -- default value as defined by devicons.
            icon_custom_colors = false,

            -- Configure icons on the bufferline.
            icon_separator_active = '▎',
            icon_separator_inactive = '▎',
            icon_close_tab = '',
            icon_pinned = '車',
            icon_close_tab_modified = '●',

            -- Enable/disable close button
            closable = false,

            -- Enables/disable clickable tabs
            -- left-click: go to buffer
            -- middle-click: delete buffer
            clickable = true,

            -- If set, the letters for each buffer in buffer-pick mode will be
            -- assigned based on their name. Otherwise or in case all letters are
            -- already assigned, the behavior is to assign letters in order of
            -- usability (see order below)
            semantic_letters = true,

            -- New buffer letters are assigned in this order. This order is
            -- optimal for the qwerty keyboard layout but might need adjustement
            -- for other layouts.
            letters = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP',

            -- Sets the maximum padding width with which to surround each tab
            maximum_padding = 0,

            -- Sets the maximum buffer name length.
            maximum_length = 40,

            -- Enable/disable auto-hiding the tab bar when there is a single buffer
            auto_hide = false,

            -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
            -- hide = { extensions = true, inactive = false },
        },
        keys = {
            -- Magic buffer-picking mode
            { '<leader>bb', '<cmd>BufferPick<cr>', desc = 'Pick Buffer', silent = true },
            -- Move to previous/next
            { '[b', ":BufferPrevious<CR>", desc = 'Previous Buffer', silent = true },
            { ']b', ":BufferNext<CR>", desc = 'Next Buffer', silent = true },

            -- Re-order to previous/next
            { '<Leader>b<', ":BufferMovePrevious<CR>", desc = 'Move Buffer left', silent = true },
            { '<Leader>b>', ":BufferMoveNext<CR>", desc = 'Move Buffer right', silent = true },

            -- Goto buffer in position...
            { '<Leader>1', ":BufferGoto 1<CR>", desc = 'Jump to Buffer 1', silent = true },
            { '<Leader>2', ":BufferGoto 2<CR>", desc = 'Jump to Buffer 2', silent = true },
            { '<Leader>3', ":BufferGoto 3<CR>", desc = 'Jump to Buffer 3', silent = true },
            { '<Leader>4', ":BufferGoto 4<CR>", desc = 'Jump to Buffer 4', silent = true },
            { '<Leader>5', ":BufferGoto 5<CR>", desc = 'Jump to Buffer 5', silent = true },
            { '<Leader>6', ":BufferGoto 6<CR>", desc = 'Jump to Buffer 6', silent = true },
            { '<Leader>7', ":BufferGoto 7<CR>", desc = 'Jump to Buffer 7', silent = true },
            { '<Leader>8', ":BufferGoto 8<CR>", desc = 'Jump to Buffer 8', silent = true },
            { '<Leader>9', ":BufferLast<CR>", desc = 'Jump to last Buffer', silent = true },
            { '<Leader>p', ":BufferPin<CR>", desc = 'Pin Buffer', silent = true },

            -- Close buffer
            { '<Leader>q', ":BufferClose<CR>", desc = 'Close Buffer', silent = true },

            -- " Wipeout buffer
            { '<Leader>Q', ":BufferWipeout<CR>", desc = 'Wipe Buffer', silent = true },

            { 'Q', ":BufferCloseAllButCurrent<CR>", desc = 'Close all Buffers but current', silent = true },
            { 'QP', ":BufferCloseAllButPinned<CR>", desc = 'Close all Buffers but pinned', silent = true },
            { 'Q>', ":BufferCloseBuffersRight<CR>", desc = 'Close all Buffers right', silent = true },
            { 'Q<', ":BufferCloseBuffersLeft<CR>", desc = 'Close all Buffers left', silent = true },
        },
    },
}
