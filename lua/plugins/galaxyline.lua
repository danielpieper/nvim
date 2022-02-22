local o = vim.o
local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

o.showmode = false -- Hide mode as it's provided by the plugin
o.laststatus = 2 -- Show status line
o.showtabline = 2  -- Show tabline

local colors = {
  bg       = '#151718',
  line_bg  = '#151718',
  line_fg  = '#4f5560',
  sep      = '#0f1112',
  fg       = '#abb2bf',
  black    = '#1d1f21',
  yellow   = '#e5c07b',
  cyan     = '#56b6c2',
  darkblue = '#081633',
  green    = '#98c379',
  orange   = '#d19a66',
  purple   = '#5d4d7a',
  magenta  = '#c678dd',
  grey     = '#abb2bf',
  blue     = '#61afef',
  red      = '#e06c75'
}

local get_lsp_client = function (msg)
  msg = msg or 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    return msg
  end
  for _,client in ipairs(buf_clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 and client.name ~= 'null-ls' then
      return client.name
    end
  end
  return msg
end

gls.left[1] = {
  FirstElement = {
    provider = function() return ' ' end,
    highlight = { colors.line_fg, colors.line_bg }
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = { color = colors.line_fg, name = 'NORMAL' },
        i = { color = colors.green, name = 'INSERT' },
        v = { color = colors.blue, name = 'VISUAL' },
        [''] = { color = colors.blue, name = 'VISUAL' },
        V = { color = colors.blue, name = 'VISUAL' },
        c = { color = colors.red, name = 'COMMAND' },
        no = { color = colors.magenta, name = 'NORMAL' },
        s = { color = colors.orange, name = 'NORMAL' },
        S = { color = colors.orange, name = 'NORMAL' },
        [''] = { color = colors.orange, name = 'NORMAL' },
        ic = { color = colors.yellow, name = 'NORMAL' },
        R = { color = colors.purple, name = 'NORMAL' },
        Rv = { color = colors.purple, name = 'NORMAL' },
        cv = { color = colors.red, name = 'NORMAL' },
        ce = { color = colors.red, name = 'NORMAL' },
        r = { color = colors.cyan, name = 'NORMAL' },
        rm = { color = colors.cyan, name = 'NORMAL' },
        ['r?'] = { color = colors.cyan, name = 'NORMAL' },
        ['!']  = { color = colors.red, name = 'NORMAL' },
        t = { color = colors.green, name = 'TERMINAL' },
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..alias[vim.fn.mode()].color)

      return alias[vim.fn.mode()].name
    end,
    separator = '▕',
    separator_highlight = { colors.sep, colors.line_bg },
    highlight = {colors.line_fg, colors.line_bg, 'bold'},
  },
}
gls.left[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    highlight = { colors.orange, colors.line_bg},
  }
}
gls.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    separator = '▕ ',
    separator_highlight = { colors.sep, colors.line_bg },
    highlight = { colors.line_fg, colors.line_bg },
  }
}
gls.left[5] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = { require('galaxyline.providers.fileinfo').get_file_icon_color, colors.line_bg },
  },
}
gls.left[6] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = condition.buffer_not_empty,
    separator = '▕',
    separator_highlight = { colors.sep, colors.line_bg },
    highlight = { colors.line_fg, colors.line_bg }
  }
}
gls.left[7] = {
  LspClient = {
    provider = get_lsp_client,
    icon = ' ﮧ ',
    separator = ' ',
    separator_highlight = { colors.sep, colors.line_bg },
    condition = condition.check_active_lsp,
    highlight = { colors.line_fg, colors.line_bg },
  }
}
gls.left[8] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    separator = ' ',
    separator_highlight = { colors.sep, colors.line_bg },
    highlight = { colors.yellow, colors.line_bg },
  }
}
gls.left[9] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    separator = ' ',
    separator_highlight = { colors.sep, colors.line_bg },
    highlight = { colors.red, colors.line_bg },
  }
}

gls.right[1] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.green, colors.line_bg },
  }
}
gls.right[2] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.orange, colors.line_bg },
  }
}
gls.right[3] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.red, colors.line_bg },
  }
}
gls.right[4] = {
  Space = {
    provider = function () return ' ' end,
    condition = condition.hide_in_width,
    separator = '▕',
    separator_highlight = { colors.sep, colors.line_bg },
    highlight = { colors.line_fg, colors.line_bg },
  }
}
gls.right[5]= {
  FileFormat = {
    provider = 'FileFormat',
    highlight = { colors.line_fg, colors.line_bg }
  }
}
gls.right[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '▕ ',
    separator_highlight = { colors.sep, colors.line_bg },
    highlight = { colors.line_fg, colors.line_bg }
  },
}
gls.right[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '▕',
    separator_highlight = { colors.sep, colors.line_bg },
    highlight = { colors.line_fg, colors.line_bg }
  }
}

gls.short_line_left[1] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = { require('galaxyline.providers.fileinfo').get_file_icon_color, colors.line_bg },
  },
}
gls.short_line_left[2] = {
  FileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.line_fg, colors.line_bg }
  }
}
gls.short_line_right[1] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = { colors.line_fg, colors.line_bg }
  },
}
gls.short_line_right[2] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = { colors.line_fg, colors.line_bg },
  },
}
