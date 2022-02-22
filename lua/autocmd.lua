local utils = require("utils")

-- Open help in a vertical split
utils.augroup(
  'vimrc-help',
  function ()
    vim.cmd([[autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | setlocal relativenumber | endif]])
  end
)

utils.augroup(
  'file-types',
  function ()
    -- Override some syntaxes so things look better
    vim.cmd('autocmd BufNewFile,BufRead *.html setlocal syntax=swig')
    vim.cmd('autocmd BufNewFile,BufRead *.sss setlocal syntax=stylus')
    vim.cmd('autocmd BufNewFile,BufRead *.snap,*.es6, setlocal filetype=javascript.jsx')
    vim.cmd('autocmd BufNewFile,BufRead *stylelintrc,*eslintrc,*babelrc,*jshintrc setlocal syntax=json')
    vim.cmd('autocmd BufNewFile,BufRead *.css,*.pcss setlocal syntax=scss filetype=scss')
    vim.cmd('autocmd BufNewFile,BufRead *.cshtml setlocal filetype=cshtml')
    vim.cmd('autocmd BufNewFile,BufRead *.vue setlocal filetype=vue.html.javascript.css')
    vim.cmd('autocmd BufNewFile,BufRead *.neon setlocal filetype=yaml')

    -- Override golang template files (mainly for chezmoi):
    vim.cmd('autocmd BufNewFile,BufRead *.vim.tmpl setlocal filetype=vim')
    vim.cmd('autocmd BufNewFile,BufRead *.json.tmpl setlocal filetype=json')
    vim.cmd('autocmd BufNewFile,BufRead *.conf.tmpl setlocal filetype=conf')
    vim.cmd('autocmd BufNewFile,BufRead *.yaml.tmpl setlocal filetype=yaml')
    vim.cmd('autocmd BufNewFile,BufRead *.yml.tmpl setlocal filetype=yaml')
    vim.cmd('autocmd BufNewFile,BufRead *.lua.tmpl setlocal filetype=lua')
    vim.cmd('autocmd BufNewFile,BufRead *.sh.tmpl setlocal filetype=bash')
    vim.cmd('autocmd BufNewFile,BufRead Tiltfile setlocal filetype=config')
    vim.cmd('autocmd BufNewFile,BufRead Dockerfile.j2 setlocal filetype=dockerfile')
    vim.cmd('autocmd BufNewFile,BufRead *.toml.j2 setlocal filetype=toml')

    -- Wrap text and turn on spell for markdown files
    vim.cmd('autocmd BufNewFile,BufRead *.md setlocal wrap linebreak spell filetype=markdown')

    -- Automatically wrap at 72 characters and spell check git commit messages
    vim.cmd('autocmd FileType gitcommit setlocal textwidth=72')
    vim.cmd('autocmd FileType gitcommit setlocal spell')

    -- Allow stylesheets to autocomplete hyphenated words
    vim.cmd('autocmd FileType css,scss,sass setlocal iskeyword+=-')
  end
)

-- Periodically check for file changes
utils.augroup(
  'checktime',
  function ()
    vim.cmd('autocmd FocusGained,BufEnter * :silent! checktime') -- see https://vi.stackexchange.com/a/13092
    -- vim.cmd('autocmd CursorHold * silent! checktime')
  end
)

-- Resize splits when vim changes size (like with tmux opening/closing)
utils.augroup(
  'auto-resize',
  function ()
    vim.cmd('autocmd VimResized * wincmd =')
  end
)
