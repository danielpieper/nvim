-- *****************************************
-- Finding and replacing
-- *****************************************
return {
    {
        -- Find, Filter, Preview, Pick. All lua, all the time.
        'https://github.com/nvim-telescope/telescope.nvim',
        dependencies = {
            'https://github.com/nvim-lua/plenary.nvim', -- All the lua functions I don't want to write twice.
            'https://github.com/nvim-lua/popup.nvim', -- [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
            'https://github.com/nvim-telescope/telescope-symbols.nvim', -- telescope-symbols provide its users with the ability of picking symbols and insert them at point.
            'https://github.com/danielpieper/telescope-tmuxinator.nvim', -- Integration for tmuxinator with telescope.nvim.
            { 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- FZF sorter for telescope written in c
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')

            telescope.setup {
                defaults = {
                    mappings = {
                        i = {
                            ["œ"] = actions.send_selected_to_qflist + actions.open_qflist, -- <M-q> on darwin...
                        },
                        n = {
                            ["œ"] = actions.send_selected_to_qflist + actions.open_qflist, -- <M-q> on darwin...
                        },
                    },
                    layout_config = {
                        height = 0.95,
                        width = 0.95,
                    },
                },
                pickers = {
                    lsp_references = { fname_width = 50 },
                    lsp_incoming_calls = { fname_width = 50 },
                    lsp_outgoing_calls = { fname_width = 50 },
                    lsp_definitions = { fname_width = 50 },
                    lsp_type_definitions = { fname_width = 50 },
                    lsp_implementations = { fname_width = 50 },
                    lsp_document_symbols = { fname_width = 50 },
                    lsp_workspace_symbols = { fname_width = 50 },
                },
                extensions = {
                    tmuxinator = {
                        select_action = 'switch', -- | 'stop' | 'kill'
                        stop_action = 'stop', -- | 'kill'
                        disable_icons = false,
                    },
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                },
            }

            telescope.load_extension('tmuxinator')
            telescope.load_extension('fzf')
        end,
        keys = {
            {
                "<C-p>",
                ":lua require('telescope.builtin').git_files{}<CR>",
                desc = 'Find Git Files', silent = true
            },
            {
                "<M-p>",
                ":lua require('telescope.builtin').find_files{}<CR>",
                desc = 'Find Files', silent = true
            },
            {
                "π",
                ":lua require('telescope.builtin').find_files{}<CR>",
                desc = 'Find Files', silent = true
            }, -- find files on darwin...
            {
                "<BS>",
                ":lua require('telescope.builtin').command_history{}<CR>",
                desc = 'Command History', silent = true
            },
            {
                "<C-f>",
                ":lua require('telescope.builtin').live_grep{}<CR>",
                desc = 'Live grep', silent = true
            },
            {
                "<C-SPACE>",
                ":lua require('telescope.builtin').buffers{show_all_buffers = true}<CR>",
                desc = 'Find Buffers', silent = true
            }, -- Show unloaded buffers aswell
            {
                "<Leader>ff",
                ":lua require('telescope.builtin').builtin{}<CR>",
                desc = 'Telescope', silent = true
            },
            {
                "<Leader>fr",
                ":lua require('telescope.builtin').resume{}<CR>",
                desc = 'Telescope Resume', silent = true
            },
            {
                "<Leader>fgs",
                ":lua require('telescope.builtin').git_status{}<CR>",
                desc = 'Telescope Git Status', silent = true
            },
            {
                "<Leader>fgc",
                ":lua require('telescope.builtin').git_commits{}<CR>",
                desc = 'Telescope Git Commits', silent = true
            },
            {
                "<Leader>fgbr",
                ":lua require('telescope.builtin').git_branches{}<CR>",
                desc = 'Telescope Git Branches', silent = true
            },
            {
                "<C-t>",
                ":lua require('telescope').extensions.tmuxinator.projects(require('telescope.themes').get_dropdown({}))<CR>",
                desc = 'Tmuxinator Projects', silent = true
            },
        },
    },
}
