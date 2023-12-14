-- *****************************************
-- Eye Candy
-- *****************************************
return {
    {
        -- Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua! Vim splits on steroids.
        'https://github.com/nvim-focus/focus.nvim',
        version = false,
        main = "focus",
        opts = {
            enable = true,
            ui = {
                hybridnumber = true,
                cursorline = false,
            },
        },
    },
}
