-- *****************************************
-- Session
-- *****************************************
return {
    {
        -- A small automated session manager for Neovim
        "https://github.com/rmagatti/auto-session",
        name = "auto-session",
        opts = {
            log_level = "error",
            -- auto_session_use_git_branch = true,
            -- pre_save_cmds = { "FocusDisable" },
            -- post_save_cmds = { "FocusEnable" },
            -- pre_restore_cmds = { "FocusDisable" },
            -- post_restore_cmds = { "FocusEnable" },
        },
    },
}
