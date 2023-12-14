-- *****************************************
-- General
-- *****************************************
return {
    {
        -- intelligently toggling line numbers
        'https://github.com/myusuf3/numbers.vim',
        config = function()
            vim.g.numbers_exclude = {
                'unite',
                'tagbar',
                'startify',
                'gundo',
                'vimshell',
                'w3m',
                'dashboard',
                'NvimTree',
            }
        end,
    },
}
