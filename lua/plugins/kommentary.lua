-- *****************************************
-- Comments
-- *****************************************
return {
    {
        -- Neovim plugin to comment text in and out, written in lua. Supports commenting out the current line, a visual selection and a motion/textobject.
        'https://github.com/b3nj5m1n/kommentary',
        config = function()
            local config = require('kommentary.config')

            config.configure_language("default", {
                prefer_single_line_comments = true,
                use_consistent_indentation = true,
                ignore_whitespace = true,
            })

            config.configure_language("php", {
                single_line_comment_string = "//",
                multi_line_comment_strings = { "/*", "*/" },
            })
        end,
    },
}
