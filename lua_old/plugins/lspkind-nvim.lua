-- *****************************************
-- Completion
-- *****************************************
return {
    {
        -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp completion
        'https://github.com/onsails/lspkind-nvim',
        config = function()
            require("lspkind").init(
                {
                    File = " "
                }
            )
        end,
    },
}
