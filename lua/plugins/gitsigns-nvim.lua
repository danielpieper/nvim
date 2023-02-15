-- if utils.isModuleAvailable("which-key") then
--     require("which-key").register({
--         G = {
--             name = "Git",
--             b = "Toggle git blame",
--             s = "Stage hunk",
--             u = "Undo stage hunk",
--             r = "Reset hunk",
--             p = "Preview hunk",
--         },
--     }, { prefix = "<leader>" })
-- end

-- *****************************************
-- Git
-- *****************************************
return {
    {
        -- Git signs written in pure lua.
        'https://github.com/lewis6991/gitsigns.nvim',
        name = "gitsigns",
        dependencies = {
            'https://github.com/nvim-lua/plenary.nvim', -- All the lua functions I don't want to write twice.
        },
        opts = {
            signs = {
                add = { hl = "GitSignsAdd", text = "▌", numhl = "GitSignsAddNr" },
                change = { hl = "GitSignsChange", text = "▌", numhl = "GitSignsChangeNr" },
                delete = { hl = "GitSignsDelete", text = "▌", numhl = "GitSignsDeleteNr" },
                topdelete = { hl = "GitSignsDelete", text = "▌", numhl = "GitSignsDeleteNr" },
                changedelete = { hl = "GitSignsChange", text = "▌", numhl = "GitSignsChangeNr" }
            },
            numhl = false,
            current_line_blame = true,
            keymaps = {
                -- Default keymap options
                noremap = true,
                buffer = true,

                ["n ]h"] = { expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\'' },
                ["n [h"] = { expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\'' },
                ["n <leader>Gs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
                ["n <leader>Gu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
                ["n <leader>Gr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
                ["n <leader>Gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
                ["n <leader>Gb"] = '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>'
            },
        },
    },
}
