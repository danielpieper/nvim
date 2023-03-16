-- *****************************************
-- Language Specific
-- *****************************************
return {
    {
        -- 🌈 Rainbow parentheses for neovim using tree-sitter 🌈
        'https://github.com/lincheney/nvim-ts-rainbow',
        dependencies = {
            'https://github.com/nvim-treesitter/nvim-treesitter', -- Nvim Treesitter configurations and abstraction layer
        },
        config = function()
            require('nvim-treesitter.configs').setup {
                rainbow = {
                    enable = true,
                    highlight_middle = true,
                    max_file_lines = 10000, -- Do not enable for files with more than n lines, int
                }
            }
        end,
    },
}
