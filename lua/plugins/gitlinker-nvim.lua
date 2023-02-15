-- *****************************************
-- Git
-- *****************************************
return {
    {
        -- A lua neovim plugin to generate shareable file permalinks
        'https://github.com/ruifm/gitlinker.nvim',
        name = "gitlinker",
        dependencies = {
            'https://github.com/nvim-lua/plenary.nvim', -- All the lua functions I don't want to write twice.
        },
        opts = {
            mappings = nil,
        },
        keys = {
            {
                '<leader>GG',
                '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
                desc = "Open git repo url",
                silent = true,
            },
            {
                '<leader>GG',
                '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
                desc = "Open git repo url",
                mode = 'v',
            },
            {
                '<leader>GC',
                '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".copy_to_clipboard})<cr>',
                desc = "Copy git repo url to clipboard",
                silent = true,
            },
            {
                '<leader>GC',
                '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".copy_to_clipboard})<cr>',
                desc = "Copy git repo url to clipboard",
                mode = 'v',
            },
        },
    },
}
