local utils = require("utils")
local g = vim.g
local M = {}

function M.createdir()
  local data_dir = {
    'backup',
    'session',
    'swap',
    'tags',
    'undo'
  }
  for _,v in pairs(data_dir) do
    local d = utils.cache_dir .. utils.path_sep .. v
    if not utils.isdir(d) then
      os.execute("mkdir -p " .. d)
    end
  end
end

function M.disable_distribution_plugins()
  g.loaded_gzip              = 1
  g.loaded_tar               = 1
  g.loaded_tarPlugin         = 1
  g.loaded_zip               = 1
  g.loaded_zipPlugin         = 1
  g.loaded_getscript         = 1
  g.loaded_getscriptPlugin   = 1
  g.loaded_vimball           = 1
  g.loaded_vimballPlugin     = 1
  g.loaded_matchit           = 1
  g.loaded_matchparen        = 1
  g.loaded_2html_plugin      = 1
  g.loaded_logiPat           = 1
  g.loaded_rrhelper          = 1
  g.loaded_netrw             = 1
  g.loaded_netrwPlugin       = 1
  g.loaded_netrwSettings     = 1
  g.loaded_netrwFileHandlers = 1
end

function M.leader_map()
  g.mapleader = ","
  utils.map('n', ' ', '', {noremap = true})
  utils.map('x', ' ', '', {noremap = true})
end

function M.line_numbers()
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.signcolumn = "yes:1"
end

-- Backup, undo, swap options
function M.backup()
  vim.opt.undofile = true
  vim.opt.backup = true
  vim.opt.writebackup = true
  vim.opt.backupdir = utils.cache_dir .. utils.path_sep .. 'backup'
  vim.opt.directory = utils.cache_dir .. utils.path_sep .. 'swap'
  vim.opt.undodir = utils.cache_dir .. utils.path_sep .. 'undo'
  vim.opt.undolevels = 1000
  vim.opt.undoreload = 10000
  vim.opt.backupskip = '/tmp/*,/private/tmp/*' -- Don’t create backups when editing files in certain directories
end

function M.other_settings()
  -- vim.opt.colorcolumn = "80"
  vim.opt.termguicolors = true
  vim.opt.guifont = 'JetBrainsMono Nerd Font Mono:h20'
  vim.opt.autoindent = true
  vim.opt.smartindent = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  -- Use spaces, not tabs
  vim.opt.expandtab = true
  vim.opt.updatetime = 750
  -- Briefly move the cursor to the matching brace
  vim.opt.showmatch = true

  -- Add the g flag to search/replace by default
  vim.opt.gdefault = true

  -- With :set hidden, opening a new file when the current buffer has unsaved
  vim.opt.hidden = true

  -- Don't wrap lines
  vim.opt.wrap = false

  vim.opt.splitbelow = true
  vim.opt.splitright = true

  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  vim.opt.clipboard = "unnamedplus"

  -- Use `indent` based folding
  vim.opt.foldmethod = "indent"

  -- Disable all folds on file open until `zc` or `zM` etc is used
  vim.opt.foldenable = false

  -- Lazyredraw attempts to solve Vim lag by reducing the amount of
  -- processing required. When enabled, any action that is not typed
  -- will not cause the screen to redraw
  -- TODO: syntax?
  -- vim.opt.lazyredraw = true

  -- Increase redraw time for large files ...
  -- TODO: used? syntax?
  -- vim.opt.redrawtime = 10000

  -- Stop vim trying to syntax highlight long lines, typically found in minified
  -- files. This greatly reduces lag yet is still wide enough for large displays
  vim.opt.synmaxcol = 500

  -- Highlight current line
  vim.opt.cursorline = false

  -- Smoother scrolling when moving horizontally
  vim.opt.sidescroll = 1

  -- Enable mouse with tmux
  vim.opt.mouse = 'a'

  vim.opt.listchars = { tab = '  ', extends = '>', precedes = '<', nbsp = '·', trail = '·' }
  vim.opt.list = true

  vim.opt.incsearch = true
end

function M.load_settings()
  M.createdir()
  M.disable_distribution_plugins()
  M.leader_map()
  M.backup()
  M.line_numbers()
  M.other_settings()
end

M.load_settings()
