-- *****************************************
-- Database
-- *****************************************
return {
    {
        -- Database auto completion powered by vim-dadbod.
        'https://github.com/kristijanhusak/vim-dadbod-completion',
        dependencies = {
            'https://github.com/tpope/vim-dadbod', -- Dadbod is a Vim plugin for interacting with databases.
            'https://github.com/hrsh7th/nvim-cmp', -- A completion plugin for neovim coded in Lua.
        },
        ft = { 'sql', 'mysql' },
        config = function()
            local augroup = vim.api.nvim_create_augroup("DadbodCompletion", {})
            vim.api.nvim_create_autocmd("FileType", {
                group = augroup,
                pattern = "sql,mysql,plsql",
                callback = function()
                    require('cmp').setup.buffer({
                        sources = {
                            { name = 'vim-dadbod-completion' },
                            { name = 'luasnip' },
                            { name = 'buffer' },
                            { name = 'calc' },
                        },
                    })
                end,
            })
        end
    },
}
