-- *****************************************
-- LanguageServer and Diagnostics
-- *****************************************
return {
    {
        -- Standalone UI for nvim-lsp progress
        'https://github.com/j-hui/fidget.nvim',
        config = function()
            require("fidget").setup {}
        end,
    },
}
