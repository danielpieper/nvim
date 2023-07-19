-- *****************************************
-- LanguageServer and Diagnostics
-- *****************************************
return {
    {
        -- NVIM plugin to notify about LSP processes
        'https://github.com/mrded/nvim-lsp-notify',
        dependencies = {
            'https://github.com/rcarriga/nvim-notify', -- A fancy, configurable, notification manager for NeoVim
        },
        config = function()
            require('lsp-notify').setup({
                notify = require('notify'),
            })
        end
    },
}
