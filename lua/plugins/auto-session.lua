require("auto-session").setup {
    log_level = "error",
    -- auto_session_use_git_branch = true,
    pre_save_cmds = { "FocusDisable" },
    post_save_cmds = { "FocusEnable" },
    pre_restore_cmds = { "FocusDisable" },
    post_restore_cmds = { "FocusEnable" },
}
