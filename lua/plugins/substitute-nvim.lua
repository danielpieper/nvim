-- *****************************************
-- General
-- *****************************************
return {
    {
        -- Neovim plugin introducing a new operators motions to quickly replace and exchange text.
        'https://github.com/gbprod/substitute.nvim',
        name = "substitute",
        opts = {
            on_substitute = nil,
            yank_substituted_text = false,
            range = {
                prefix = "s",
                prompt_current_text = false,
                confirm = false,
                complete_word = false,
                motion1 = false,
                motion2 = false,
                suffix = "",
            },
            exchange = {
                motion = false,
                use_esc_to_cancel = true,
            },
        },
        keys = {
            { "s", "<cmd>lua require('substitute').operator()<cr>", noremap = true },
            { "ss", "<cmd>lua require('substitute').line()<cr>", noremap = true },
            { "S", "<cmd>lua require('substitute').eol()<cr>", noremap = true },
            { "s", "<cmd>lua require('substitute').visual()<cr>", mode = "x", noremap = true },
        },
    },
}
