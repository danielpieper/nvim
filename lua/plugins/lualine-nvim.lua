-- *****************************************
-- Status Bar
-- *****************************************
return {
    {
        -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
        'https://github.com/nvim-lualine/lualine.nvim',
        dependencies = {
            'https://github.com/nvim-tree/nvim-web-devicons',    -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
            'https://github.com/linrongbin16/lsp-progress.nvim', -- A performant lsp progress status for Neovim.
        },
        config = function()
            local custom_base16 = require('lualine.themes.base16')

            local colors = {
                bg = '#1D1F21',
            }

            custom_base16.normal.a.fg = colors.bg
            custom_base16.normal.b.bg = colors.bg
            custom_base16.normal.c.bg = colors.bg
            custom_base16.replace.a.fg = colors.bg
            custom_base16.replace.b.bg = colors.bg
            custom_base16.insert.a.fg = colors.bg
            custom_base16.insert.b.bg = colors.bg
            custom_base16.visual.a.fg = colors.bg
            custom_base16.visual.b.bg = colors.bg
            custom_base16.inactive.a.bg = colors.bg
            custom_base16.inactive.b.bg = colors.bg
            custom_base16.inactive.c.bg = colors.bg

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = custom_base16,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {},
                    always_divide_middle = true,
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        {
                            'filename',
                            path = 1,
                        },
                        "require('lsp-progress').progress()",
                    },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = { 'nvim-tree', 'quickfix' },
            }
        end,
    },
    {
        -- A performant lsp progress status for Neovim.
        'https://github.com/linrongbin16/lsp-progress.nvim',
        dependencies = {
            'https://github.com/nvim-tree/nvim-web-devicons', -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
        },
        config = function()
            require('lsp-progress').setup()
        end
    },
}
