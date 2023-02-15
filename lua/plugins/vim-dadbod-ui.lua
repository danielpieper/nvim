-- *****************************************
-- Database
-- *****************************************
return {
    {
        -- Simple UI for vim-dadbod. It allows simple navigation through databases and allows saving queries for later use.
        'https://github.com/kristijanhusak/vim-dadbod-ui',
        dependencies = {
            'https://github.com/tpope/vim-dadbod', -- Dadbod is a Vim plugin for interacting with databases.
        },
        cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIRenameBuffer', 'DBUIFindBuffer', 'DBUILastQueryInfo' },
        config = function()
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_execute_on_save = 0
        end,
        keys = {
            { "<F5>", ":DBUIToggle<CR>", desc = 'Open database drawer', silent = true },
            { "<Leader><F5>", ":DBUILastQueryInfo<CR>", desc = 'Last database query results', silent = true },
        },
    },
}
