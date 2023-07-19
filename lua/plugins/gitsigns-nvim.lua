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
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 2000,
                ignore_whitespace = true,
            },
        },
    },
}
