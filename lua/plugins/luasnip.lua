-- *****************************************
-- Snippets
-- *****************************************
return {
    {
        -- Snippet Engine for Neovim written in Lua.
        'https://github.com/L3MON4D3/LuaSnip',
        dependencies = {
            'https://github.com/rafamadriz/friendly-snippets' -- Set of preconfigured snippets for different languages.
        },
        config = function()
            require("luasnip/loaders/from_vscode").lazy_load()
        end,
    },
}
