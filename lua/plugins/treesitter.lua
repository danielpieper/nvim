-- *****************************************
-- Language Specific
-- *****************************************
return {
    {
        -- Nvim Treesitter configurations and abstraction layer
        'https://github.com/nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        event = "BufReadPost",
        opts = {
            highlight = {
                enable = true, -- false will disable the whole extension
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            -- one of "all", "maintained", "language", or a list of languages
            -- ensure_installed = "all",

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
