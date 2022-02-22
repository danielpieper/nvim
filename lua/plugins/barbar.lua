local map = require("utils").wkmap

-- Magic buffer-picking mode
map('n', '<Leader>bb', ':BufferPick<CR>', 'Pick Buffer', {silent = true})

-- Sort automatically by...
-- nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
-- nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

-- Move to previous/next
map('n', '[b', ":BufferPrevious<CR>", 'Previous Buffer', {silent = true})
map('n', ']b', ":BufferNext<CR>", 'Next Buffer', {silent = true})

-- Re-order to previous/next
map('n', '<Leader>b<', ":BufferMovePrevious<CR>", 'Move Buffer left', {silent = true})
map('n', '<Leader>b>', ":BufferMoveNext<CR>", 'Move Buffer right', {silent = true})

-- Goto buffer in position...
map('n', '<Leader>1', ":BufferGoto 1<CR>", 'Jump to Buffer 1', {silent = true})
map('n', '<Leader>2', ":BufferGoto 2<CR>", 'Jump to Buffer 2', {silent = true})
map('n', '<Leader>3', ":BufferGoto 3<CR>", 'Jump to Buffer 3', {silent = true})
map('n', '<Leader>4', ":BufferGoto 4<CR>", 'Jump to Buffer 4', {silent = true})
map('n', '<Leader>5', ":BufferGoto 5<CR>", 'Jump to Buffer 5', {silent = true})
map('n', '<Leader>6', ":BufferGoto 6<CR>", 'Jump to Buffer 6', {silent = true})
map('n', '<Leader>7', ":BufferGoto 7<CR>", 'Jump to Buffer 7', {silent = true})
map('n', '<Leader>8', ":BufferGoto 8<CR>", 'Jump to Buffer 8', {silent = true})
map('n', '<Leader>9', ":BufferLast<CR>", 'Jump to last Buffer', {silent = true})
map('n', '<Leader>p', ":BufferPin<CR>", 'Pin Buffer', {silent = true})

-- Close buffer
map('n', '<Leader>q', ":BufferClose<CR>", 'Close Buffer', {silent = true})

-- " Wipeout buffer
map('n', '<Leader>Q', ":BufferWipeout<CR>", 'Wipe Buffer', {silent = true})

map('n', 'Q', ":BufferCloseAllButCurrent<CR>", 'Close all Buffers but current', {silent = true})
map('n', 'QP',  ":BufferCloseAllButPinned<CR>", 'Close all Buffers but pinned', {silent = true})
map('n', 'Q>', ":BufferCloseBuffersRight<CR>", 'Close all Buffers right', {silent = true})
map('n', 'Q<', ":BufferCloseBuffersLeft<CR>", 'Close all Buffers left', {silent = true})

vim.g.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  -- icons = 'both',
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_pinned = '車',
  icon_close_tab_modified = '●',

  -- Enable/disable close button
  closable = false,

  -- Enables/disable clickable tabs
  -- left-click: go to buffer
  -- middle-click: delete buffer
  clickable = true,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP',

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 0,

  -- Sets the maximum buffer name length.
  maximum_length = 40,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,
}

