-- *****************************************
-- Language Specific
-- *****************************************
return {
    {
        -- 🌈 Rainbow parentheses for neovim using tree-sitter 🌈
        'https://github.com/p00f/nvim-ts-rainbow',
        dependencies = {
            'https://github.com/nvim-treesitter/nvim-treesitter', -- Nvim Treesitter configurations and abstraction layer
        },
        config = function()
            require('nvim-treesitter.configs').setup {
                rainbow = {
                    enable = true,
                    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                    max_file_lines = nil, -- Do not enable for files with more than n lines, int
                    -- colors = {}, -- table of hex strings
                    -- termcolors = {} -- table of colour name strings
                }
            }
        end,
    },
}
