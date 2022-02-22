local utils = {}
local home = os.getenv("HOME")
local path_sep = utils.is_windows and '\\' or '/'

function utils.load_variables()
  utils.is_mac     = jit.os == 'OSX'
  utils.is_linux   = jit.os == 'Linux'
  utils.is_windows = jit.os == 'Windows'
  utils.vim_path    = home .. path_sep..'.config'..path_sep..'nvim'
  utils.cache_dir   = home .. path_sep..'.cache'..path_sep..'nvim'
  utils.modules_dir = utils.vim_path .. path_sep..'modules'
  utils.path_sep = path_sep
  utils.home = home
end

-- Key mapping
function utils.map(mode, key, result, opts)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {
      noremap = true,
      silent = opts.silent or false,
      expr = opts.expr or false,
      script = opts.script or false
    }
  )
end

-- which-key map
function utils.wkmap(mode, key, result, name, opts)
  -- if packer_plugins["which-key.nvim"] and packer_plugins["which-key.nvim"].loaded then
  if utils.isModuleAvailable("which-key") then
    local wk = require("which-key")
    wk.register(
      { [ key ] = { result, name } },
      {
        mode = mode,
        noremap = true,
        silent = opts.silent or false,
      }
    )
  else
    utils.map(mode, key, result, opts)
  end
end

function utils.augroup(group, fn)
  vim.api.nvim_command("augroup " .. group)
  vim.api.nvim_command("autocmd!")
  fn()
  vim.api.nvim_command("augroup END")
end

function utils.get_color(synID, what, mode)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(synID)), what, mode)
end

--- Check if a file or directory exists in this path
function utils.exists(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

--- Check if a directory exists in this path
function utils.isdir(path)
  -- "/" works on both Unix and Windows
  return utils.exists(path.."/")
end

function utils.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

function utils.isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

utils.load_variables()

return utils
