-- *****************************************
-- General
-- *****************************************
return {
    {
        -- EditorConfig plugin for Vim http://editorconfig.org
        'https://github.com/editorconfig/editorconfig-vim',
        config = function()
            vim.api.nvim_set_var('EditorConfig_exclude_patterns', { 'fugitive://.*', 'scp://.*' })
        end,
    },
}
