-- *****************************************
-- Eye Candy
-- *****************************************
return {
    {
        -- A base16 colorscheme.
        'https://github.com/danielpieper/base16-arc-vim',
        priority = 1000,
        config = function()
            local c = require("colors")

            local highlights = {
                LineNr = { bg = "none", fg = c.base03 },
                CursorLineNr = { bg = "none" },
                Error = { bg = "none", fg = c.base0E },

                SignColumn = { bg = "none" },
                VertSplit = { fg = c.base01, bg = "none" },
                GitSignsAdd = { fg = c.base0B, bg = "none" },
                GitSignsChange = { fg = c.base09, bg = "none" },
                GitSignsDelete = { fg = c.base0E, bg = "none" },
                EndOfBuffer = { fg = c.base02 },

                -- TODO:
                DiffAdd = { bg = "#262626", fg = c.base0B, reverse = true },
                DiffChange = { bg = "#262626", fg = c.base09, reverse = true },
                DiffDelete = { bg = "#262626", fg = c.base0E, reverse = true },
                DiffText = { bg = "#262626", fg = c.base0D, reverse = true },

                TelescopeBorder = { fg = c.base03 },
                TelescopePromptBorder = { fg = c.base03 },
                TelescopeResultsBorder = { fg = c.base03 },
                TelescopePreviewBorder = { fg = c.base03 },
                -- Constant = { fg = c.base09 },
                ["@variable"] = { fg = c.base04 },

                -- highlights for indent lines:
                Conceal = { fg = c.base02 },
                Whitespace = { fg = c.base02 },
                NvimTreeIndentMarker = { fg = c.base02 },
                IndentBlanklineContextChar = { fg = c.base03 },

                Search = { fg = c.base00, bg = c.base09 },
                IncSearch = { fg = c.base00, bg = c.base08 },

                NvimTreeFolderIcon = { fg = c.base0D },
                NvimTreeFolderName = { fg = c.base0D },

                LspDiagnosticsDefaultError = { fg = c.base0E, bg = "none" },
                LspDiagnosticsDefaultWarning = { fg = c.base08, bg = "none" },
                LspDiagnosticsDefaultInformation = { fg = c.base0D, bg = "none" },
                LspDiagnosticsDefaultHint = { fg = c.base07, bg = "none" },

                LspDiagnosticsUnderlineError = { undercurl = true, fg = c.base0E, bg = "none" },
                LspDiagnosticsUnderlineWarning = { undercurl = true, fg = c.base08, bg = "none" },
                LspDiagnosticsUnderlineInformation = { undercurl = true, fg = c.base0D, bg = "none" },
                LspDiagnosticsUnderlineHint = { undercurl = true, fg = c.base07, bg = "none" },

                BufferCurrent = { fg = c.base0D, bg = c.base00 },
                BufferVisible = { bg = c.base00 },
                BufferVisibleIcon = { bg = c.base00 },
                BufferVisibleMod = { bg = c.base00 },
                BufferVisibleIndex = { bg = c.base00 },
                BufferVisibleSign = { bg = c.base00 },
                BufferInactiveSign = { fg = "Black", bg = c.base01 },

                rainbowcol1 = { fg = c.base08 },
                rainbowcol2 = { fg = c.base09 },
                rainbowcol3 = { fg = c.base0A },
                rainbowcol4 = { fg = c.base0B },
                rainbowcol5 = { fg = c.base0C },
                rainbowcol6 = { fg = c.base0D },
                rainbowcol7 = { fg = c.base0E },
            }

            vim.api.nvim_create_autocmd("Colorscheme", {
                callback = function()
                    for name, hi in pairs(highlights) do
                        vim.api.nvim_set_hl(0, name, hi)
                    end
                end,
            })

            vim.api.nvim_command("colorscheme base16-arc")
        end,
    },
}
