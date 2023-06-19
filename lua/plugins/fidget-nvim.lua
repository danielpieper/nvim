-- *****************************************
-- LanguageServer and Diagnostics
-- *****************************************
return {
    {
        -- Standalone UI for nvim-lsp progress
        'https://github.com/j-hui/fidget.nvim',
        tag = 'legacy',
        config = function()
            require("fidget").setup {}
        end,
    },
}
