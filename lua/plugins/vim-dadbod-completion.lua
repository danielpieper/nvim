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
