local highlights = {
    LineNr = { bg = "none" },
    CursorLineNr = { bg = "none" },

    SignColumn     = { bg = "none" },
    VertSplit      = { fg = "#151718", bg = "none" },
    GitSignsAdd    = { fg = "#87af87", bg = "none" },
    GitSignsChange = { fg = "#d19a66", bg = "none" },
    GitSignsDelete = { fg = "#e06c75", bg = "none" },
    EndOfBuffer    = { fg = "#2c323c" },

    -- TODO:
    DiffAdd = { bg = "#262626", fg = "#87af87", reverse = true },
    DiffChange = { bg = "#262626", fg = "#d19a66", reverse = true },
    DiffDelete = { bg = "#262626", fg = "#e06c75", reverse = true },
    DiffText = { bg = "#262626", fg = "#61afef", reverse = true },

    TelescopeBorder        = { fg = "#5c6370" },
    TelescopePromptBorder  = { fg = "#5c6370" },
    TelescopeResultsBorder = { fg = "#5c6370" },
    TelescopePreviewBorder = { fg = "#5c6370" },

    -- PmenuSel = { bg = "#61afef" },
    -- Constant = { fg = "#d19a66" },

    -- highlights for indent lines:
    Conceal              = { fg = "#2c323c" },
    Whitespace           = { fg = "#2c323c" },
    NvimTreeIndentMarker = { fg = "#2c323c" },

    Search    = { fg = "#1D1F21", bg = "#d19a66" },
    IncSearch = { fg = "#1D1F21", bg = "#e5c07b" },

    NvimTreeFolderIcon = { fg = "#61afef" },
    NvimTreeFolderName = { fg = "#61afef" },

    LspDiagnosticsDefaultError       = { fg = "Red", bg = "none" },
    LspDiagnosticsDefaultWarning     = { fg = "Yellow", bg = "none" },
    LspDiagnosticsDefaultInformation = { fg = "#61afef", bg = "none" },
    LspDiagnosticsDefaultHint        = { fg = "LightGray", bg = "none" },

    LspDiagnosticsUnderlineError       = { undercurl = true, fg = "#e06c75", bg = "none" },
    LspDiagnosticsUnderlineWarning     = { undercurl = true, fg = "#e5c07b", bg = "none" },
    LspDiagnosticsUnderlineInformation = { undercurl = true, fg = "#61afef", bg = "none" },
    LspDiagnosticsUnderlineHint        = { undercurl = true, fg = "LightGray", bg = "none" },

    BufferCurrent      = { fg = "#61afef", bg = "#1D1F21" },
    BufferVisible      = { bg = "#1D1F21" },
    BufferVisibleIcon  = { bg = "#1D1F21" },
    BufferVisibleMod   = { bg = "#1D1F21" },
    BufferVisibleIndex = { bg = "#1D1F21" },
    BufferVisibleSign  = { bg = "#1D1F21" },
    BufferInactiveSign = { fg = "Black", bg = "#151718" },

    rainbowcol1 = { fg = "#eacd95" },
    rainbowcol2 = { fg = "#daae85" },
    rainbowcol3 = { fg = "#d193e4" },
    rainbowcol4 = { fg = "#adcf94" },
    rainbowcol5 = { fg = "#78c5ce" },
    rainbowcol6 = { fg = "#61afef" },
    rainbowcol7 = { fg = "#e68991" },
}

vim.api.nvim_create_autocmd("Colorscheme", {
    callback = function()
        for name, hi in pairs(highlights) do
            vim.api.nvim_set_hl(0, name, hi)
        end
    end,
})

vim.api.nvim_command("colorscheme base16-arc")
