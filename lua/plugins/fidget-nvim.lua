-- *****************************************
-- LanguageServer and Diagnostics
-- *****************************************
return {
    {
        -- Standalone UI for nvim-lsp progress
        'https://github.com/j-hui/fidget.nvim',
        enabled = false,
        tag = 'legacy',
        config = function()
            require("fidget").setup {}
        end,
    },
}
