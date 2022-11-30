local telescope = require('telescope')
local actions = require('telescope.actions')
local map = require("utils").wkmap

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

map("n", "<C-p>", ":lua require('telescope.builtin').git_files{}<CR>", 'Find Git Files', { silent = true })
map("n", "<M-p>", ":lua require('telescope.builtin').find_files{}<CR>", 'Find Files', { silent = true })
map("n", "π", ":lua require('telescope.builtin').find_files{}<CR>", 'Find Files', { silent = true }) -- find files on darwin...
map("n", "<BS>", ":lua require('telescope.builtin').command_history{}<CR>", 'Command History', { silent = true })
map("n", "<C-f>", ":lua require('telescope.builtin').live_grep{}<CR>", 'Live grep', { silent = true })
map("n", "<C-SPACE>", ":lua require('telescope.builtin').buffers{show_all_buffers = true}<CR>", 'Find Buffers', { silent = true }) -- Show unloaded buffers aswell
map("n", "<Leader>ff", ":lua require('telescope.builtin').builtin{}<CR>", 'Telescope', { silent = true })
map("n", "<C-t>", ":lua require('telescope').extensions.tmuxinator.projects(require('telescope.themes').get_dropdown({}))<CR>", 'Tmuxinator Projects', { silent = true })
