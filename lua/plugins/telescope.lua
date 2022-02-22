local telescope = require('telescope')
local actions = require('telescope.actions')
local map = require("utils").wkmap

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["œ"] = actions.send_selected_to_qflist + actions.open_qflist, -- <M-q> on darwin...
      },
      n = {
        ["œ"] = actions.send_selected_to_qflist + actions.open_qflist, -- <M-q> on darwin...
      },
    },
  },
  extensions = {
    tmuxinator = {
      select_action = 'switch', -- | 'stop' | 'kill'
      stop_action = 'stop', -- | 'kill'
      disable_icons = false,
    },
  },
}

map("n", "<C-p>", ":lua require('telescope.builtin').git_files{}<CR>", 'Find Git Files', {silent = true})
map("n", "<M-p>", ":lua require('telescope.builtin').find_files{}<CR>", 'Find Files', {silent = true})
map("n", "π", ":lua require('telescope.builtin').find_files{}<CR>", 'Find Files', {silent = true}) -- find files on darwin...
map("n", "<BS>", ":lua require('telescope.builtin').command_history{}<CR>", 'Command History', {silent = true})
map("n", "<C-f>", ":lua require('telescope.builtin').live_grep{}<CR>", 'Live grep', {silent = true})
map("n", "<C-SPACE>", ":lua require('telescope.builtin').buffers{show_all_buffers = true}<CR>", 'Find Buffers', {silent = true}) -- Show unloaded buffers aswell
map("n", "<Leader>o", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", 'Find LSP Document Symbols', {silent = true})
map("n", "<Leader>O", ":lua require('telescope.builtin').lsp_references{}<CR>", 'Find LSP references', {silent = true})
map("n", "<Leader>ff", ":lua require('telescope.builtin').builtin{}<CR>", 'Telescope', {silent = true})

require('telescope').load_extension('tmuxinator')
map("n", "<C-t>", ":lua require('telescope').extensions.tmuxinator.projects(require('telescope.themes').get_dropdown({}))<CR>", 'Tmuxinator Projects', {silent = true})

