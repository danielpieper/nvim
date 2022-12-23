local aucmd_dict = {
    FileType = {
        {
            pattern = "markdown,txt",
            callback = function()
                vim.api.nvim_win_set_option(0, "spell", true)
                vim.api.nvim_win_set_option(0, "wrap", true)
                vim.api.nvim_win_set_option(0, "linebreak", true)
            end,
        },
        {
            pattern = "gitcommit",
            callback = function()
                vim.api.nvim_win_set_option(0, "spell", true)
                vim.api.nvim_buf_set_option(0, "textwidth", 72)
            end,
        },
        {
            pattern = "help,lspinfo,qf,startuptime",
            callback = function()
                vim.keymap.set(
                    "n",
                    "q",
                    "<cmd>close<CR>",
                    { noremap = true, silent = true }
                )
            end,
        },
    },
    BufEnter = {
        {
            -- Open help in a vertical split
            pattern = "*.txt",
            command = "if &buftype == 'help' | wincmd L | setlocal relativenumber | endif",
        },
    },
    ["BufNewFile,BufRead"] = {
        {
            pattern = "*stylelintrc,*eslintrc,*babelrc,*jshintrc",
            callback = function()
                vim.api.nvim_buf_set_option(0, "syntax", "json")
            end,
        },
        {
            pattern = "*.vue",
            callback = function()
                vim.api.nvim_buf_set_option(0, "filetype", "vue.html.javascript.css")
            end,
        },
        {
            pattern = "*.neon",
            callback = function()
                vim.api.nvim_buf_set_option(0, "filetype", "yaml")
            end,
        },
        {
            pattern = "Tiltfile",
            callback = function()
                vim.api.nvim_buf_set_option(0, "syntax", "config")
            end,
        },
    },
}

for event, opt_tbls in pairs(aucmd_dict) do
    for _, opt_tbl in pairs(opt_tbls) do
        vim.api.nvim_create_autocmd(event, opt_tbl)
    end
end
