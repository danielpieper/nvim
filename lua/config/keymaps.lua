-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function create_array(count, item)
  local array = {}
  for _ = 1, count do
    table.insert(array, item)
  end
  return array
end

local function paste_blank_line(line)
  local lines = create_array(vim.v.count1, "")
  vim.api.nvim_buf_set_lines(0, line, line, true, lines)
end

local function paste_blank_line_above()
  paste_blank_line(vim.fn.line(".") - 1)
end

local function paste_blank_line_below()
  paste_blank_line(vim.fn.line("."))
end

vim.keymap.set("n", "[<Space>", paste_blank_line_above, { desc = "Add blank line above" })
vim.keymap.set("n", "]<Space>", paste_blank_line_below, { desc = "Add blank line below" })

local function copy_rel_path()
  local path = string.sub(vim.fn.expand("%:h"), string.len(vim.fn.getcwd()) + 2)
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end

local function copy_rel_file()
  local path = string.sub(vim.fn.expand("%"), string.len(vim.fn.getcwd()) + 2)
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end

vim.keymap.set("n", "<Leader>by", copy_rel_path, { desc = "Copy relative path" })
vim.keymap.set("n", "<Leader>bY", copy_rel_file, { desc = "Copy relative file" })
