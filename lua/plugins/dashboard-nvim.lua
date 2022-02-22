local utils = require("utils")
local g = vim.g

g.dashboard_default_executive ='telescope'
g.dashboard_session_directory = utils.cache_dir .. utils.path_sep .. 'session'

g.dashboard_custom_shortcut = {
  last_session       = '        ',
  find_history       = '        ',
  find_file          = 'Alt + p ',
  new_file           = '        ',
  change_colorscheme = '        ',
  find_word          = 'Ctrl + f',
  book_marks         = '        ',
}

-- map("n", "<Leader>fh", "DashboardFindHistory<CR>", {silent=true})
-- nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
-- nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
-- nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
-- nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
-- nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

g.dashboard_custom_header = {
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}
