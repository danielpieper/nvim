-- *****************************************
-- File management
-- *****************************************
return {
    {
        -- A File Explorer For Neovim Written In Lua
        'https://github.com/kyazdani42/nvim-tree.lua',
        dependencies = {
            'https://github.com/kyazdani42/nvim-web-devicons' -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
        },
        config = function()
            local tree_cb = require('nvim-tree.config').nvim_tree_callback

            require('nvim-tree').setup {
                -- disables netrw completely
                disable_netrw       = false,
                -- hijack netrw window on startup
                hijack_netrw        = false,
                -- open the tree when running this setup function
                open_on_setup       = false,
                -- will not open on setup if the filetype is in this list
                ignore_ft_on_setup  = {},
                -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
                open_on_tab         = false,
                -- hijack the cursor in the tree to put it at the start of the filename
                hijack_cursor       = false,
                -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
                update_cwd          = false,
                -- show lsp diagnostics in the signcolumn
                diagnostics         = {
                    enable = false,
                },
                -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
                update_focused_file = {
                    -- enables the feature
                    enable      = false,
                    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
                    -- only relevant when `update_focused_file.enable` is true
                    update_cwd  = false,
                    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
                    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
                    ignore_list = { '.git', 'node_modules', '.cache' },
                },
                -- configuration options for the system open command (`s` in the tree by default)
                system_open         = {
                    -- the command to run this, leaving nil should work in most cases
                    cmd  = nil,
                    -- the command arguments as a list
                    args = {}
                },
                git                 = {
                    enable = true,
                    ignore = false,
                    timeout = 500,
                },

                view = {
                    -- width of the window, can be either a number (columns) or a string in `%`
                    width = 60,
                    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
                    side = 'right',
                    mappings = {
                        -- custom only false will merge the list with the default mappings
                        -- if true, it will only use your list to set the mappings
                        custom_only = false,
                        -- list of mappings to set on the tree manually
                        list = {
                            { key = "l", cb = tree_cb("edit") },
                        }
                    }
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                },
            }

            vim.g.nvim_tree_indent_markers = 1
            vim.g.nvim_tree_git_hl = 1

            vim.api.nvim_set_var('nvim_tree_icons', {
                default = '',
                symlink = '',
            })
        end,
        keys = {
            { '<F3>', ':NvimTreeToggle<CR>', desc = "Open Files Drawer", silent = true },
            { '<Leader><F3>', ':NvimTreeFindFile<CR>', desc = "Open Files Drawer at current file", silent = true },
        },
    },
}
