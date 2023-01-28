local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Only required if you have packer in your `opt` pack
vim.api.nvim_command('packadd packer.nvim')

-- see https://github.com/rhysd/vim-startuptime
return require('packer').startup {
    function(use)
        use { 'https://github.com/wbthomason/packer.nvim', opt = true } -- Packer can manage itself as an optional plugin


        -- *****************************************
        -- Eye Candy
        -- *****************************************
        use 'https://github.com/kyazdani42/nvim-web-devicons' -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
        use {
            'https://github.com/danielpieper/base16-arc-vim',
            branch = 'main',
            config = 'require("plugins.base16-arc")',
        } -- A base16 colorscheme.
        use 'https://github.com/psliwka/vim-smoothie' -- Smooth scrolling for Vim done right🥤
        use 'https://github.com/camspiers/animate.vim' -- A Vim Window Animation Library
        use {
            'https://github.com/norcalli/nvim-colorizer.lua',
            config = 'require("colorizer").setup()'
        } -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
        use {
            'https://github.com/lukas-reineke/indent-blankline.nvim',
            config = 'require("plugins.indent-blankline-nvim")',
        } -- Indent guides for Neovim
        use {
            'https://github.com/beauwilliams/focus.nvim',
            config = 'require("plugins.focus-nvim")',
        } -- Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua! Vim splits on steroids.


        -- *****************************************
        -- Language Specific
        -- *****************************************
        -- use 'https://github.com/sheerun/vim-polyglot' -- A collection of language packs for Vim.
        -- use 'https://github.com/rhysd/vim-syntax-codeowners' -- Vim syntax support for CODEOWNERS file supported by GitHub
        use {
            'https://github.com/nvim-treesitter/nvim-treesitter',
            config = 'require("plugins.treesitter")',
            run = ':TSUpdate'
        } -- Nvim Treesitter configurations and abstraction layer
        use {
            'https://github.com/nvim-treesitter/playground',
            disable = true,
        } -- Treesitter playground integrated into Neovim
        use {
            'https://github.com/p00f/nvim-ts-rainbow',
            config = 'require("plugins.nvim-ts-rainbow")',
            requires = {
                'https://github.com/nvim-treesitter/nvim-treesitter', -- Nvim Treesitter configurations and abstraction layer
            }
        } -- 🌈 Rainbow parentheses for neovim using tree-sitter 🌈
        use 'https://github.com/towolf/vim-helm' -- vim syntax for helm templates (yaml + gotmpl + sprig + custom)


        -- *****************************************
        -- Git
        -- *****************************************
        use {
            'https://github.com/ruifm/gitlinker.nvim',
            config = 'require("plugins.gitlinker-nvim")',
            requires = {
                'https://github.com/nvim-lua/plenary.nvim', -- All the lua functions I don't want to write twice.
            },
        } -- A lua neovim plugin to generate shareable file permalinks
        use {
            'https://github.com/lewis6991/gitsigns.nvim',
            branch = 'main',
            config = 'require("plugins.gitsigns-nvim")',
            requires = {
                'https://github.com/nvim-lua/plenary.nvim', -- All the lua functions I don't want to write twice.
            },
        } -- Git signs written in pure lua.


        -- *****************************************
        -- General
        -- *****************************************
        use {
            'https://github.com/myusuf3/numbers.vim',
            config = 'require("plugins.numbers-vim")',
        } -- intelligently toggling line numbers
        use {
            'https://github.com/editorconfig/editorconfig-vim',
            config = 'require("plugins.editorconfig-vim")'
        } -- EditorConfig plugin for Vim http://editorconfig.org
        use 'https://github.com/tpope/vim-unimpaired' -- complementary pairs of mappings.
        use {
            'https://github.com/kylechui/nvim-surround',
            config = 'require("plugins.nvim-surround")'
        } -- Add/change/delete surrounding delimiter pairs with ease. Written with heart in Lua.
        use 'https://github.com/ConradIrwin/vim-bracketed-paste' -- Improve pasting code from the clipboard
        use {
            'https://github.com/tpope/vim-repeat',
            disable = true,
        } -- Repeat.vim remaps . in a way that plugins can tap into it
        use {
            'https://github.com/junegunn/vim-easy-align',
            opt = true,
            cmd = 'EasyAlign',
        } -- A simple, easy-to-use Vim alignment plugin.
        use {
            'https://github.com/ojroques/nvim-osc52',
            config = 'require("plugins.nvim-osc52")'
        } -- A Vim plugin to copy text through SSH with OSC52
        use {
            'https://github.com/gbprod/substitute.nvim',
            config = 'require("plugins.substitute-nvim")'
        } -- Neovim plugin introducing a new operators motions to quickly replace and exchange text.


        -- *****************************************
        -- Comments
        -- *****************************************
        use {
            'https://github.com/b3nj5m1n/kommentary',
            config = 'require("plugins.kommentary")'
        } -- Neovim plugin to comment text in and out, written in lua. Supports commenting out the current line, a visual selection and a motion/textobject.


        -- *****************************************
        -- Snippets
        -- *****************************************
        use 'https://github.com/rafamadriz/friendly-snippets' -- Set of preconfigured snippets for different languages.
        use { 'https://github.com/L3MON4D3/LuaSnip',
            config = 'require("plugins.luasnip")',
            requires = {
                'https://github.com/rafamadriz/friendly-snippets' -- Set of preconfigured snippets for different languages.
            }
        } -- Snippet Engine for Neovim written in Lua.


        -- *****************************************
        -- Session
        -- *****************************************
        use 'https://github.com/rmagatti/auto-session' -- A small automated session manager for Neovim


        -- *****************************************
        -- Status Bar
        -- *****************************************
        use {
            'https://github.com/nvim-lualine/lualine.nvim',
            config = 'require("plugins.lualine-nvim")',
            requires = {
                'https://github.com/kyazdani42/nvim-web-devicons', -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
            }
        } -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.


        -- *****************************************
        -- Buffers
        -- *****************************************
        use {
            'https://github.com/romgrk/barbar.nvim',
            config = 'require("plugins.barbar")',
            requires = {
                'https://github.com/kyazdani42/nvim-web-devicons', -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
            }
        } -- Tabs, as understood by any other editor.


        -- *****************************************
        -- File management
        -- *****************************************
        use {
            'https://github.com/kyazdani42/nvim-tree.lua',
            config = 'require("plugins.nvim-tree")',
            requires = {
                'https://github.com/kyazdani42/nvim-web-devicons' -- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
            }
        } -- A File Explorer For Neovim Written In Lua


        -- *****************************************
        -- Finding and replacing
        -- *****************************************
        use {
            'https://github.com/nvim-telescope/telescope.nvim',
            config = 'require("plugins.telescope")',
            requires = {
                'https://github.com/nvim-lua/plenary.nvim', -- All the lua functions I don't want to write twice.
                'https://github.com/nvim-lua/popup.nvim', -- [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
                'https://github.com/nvim-telescope/telescope-symbols.nvim', -- telescope-symbols provide its users with the ability of picking symbols and insert them at point.
                'https://github.com/danielpieper/telescope-tmuxinator.nvim', -- Integration for tmuxinator with telescope.nvim.
                -- '~/projects/telescope-tmuxinator.nvim',
                { 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', run = 'make' }, -- FZF sorter for telescope written in c
            }
        } -- Find, Filter, Preview, Pick. All lua, all the time.
        use {
            'https://github.com/folke/which-key.nvim',
            config = 'require("plugins.which-key")',
        } -- 💥 Create key bindings that stick.


        -- *****************************************
        -- Completion
        -- *****************************************
        use {
            'https://github.com/onsails/lspkind-nvim',
            config = 'require("plugins.lspkind-nvim")',
        } -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp completion
        use {
            'https://github.com/hrsh7th/nvim-cmp',
            config = 'require("plugins.nvim-cmp")',
            requires = {
                'https://github.com/hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
                'https://github.com/hrsh7th/cmp-emoji', -- nvim-cmp source for emoji
                'https://github.com/hrsh7th/cmp-nvim-lua', -- nvim-cmp source for nvim lua
                'https://github.com/hrsh7th/cmp-path', -- nvim-cmp source for path
                'https://github.com/hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim builtin LSP client
                'https://github.com/hrsh7th/cmp-calc', -- nvim-cmp source for math calculation
                'https://github.com/onsails/lspkind-nvim', -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp completion
                'https://github.com/L3MON4D3/LuaSnip',
                'https://github.com/saadparwaiz1/cmp_luasnip', -- luasnip completion source for nvim-cmp
                'https://github.com/hrsh7th/cmp-cmdline', -- nvim-cmp source for vim's cmdline.
                'https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol', -- The purpose is the demonstration customize / search by nvim-cmp.
            }
        } -- A completion plugin for neovim coded in Lua.


        -- *****************************************
        -- LanguageServer and Diagnostics
        -- *****************************************
        use {
            'https://github.com/neovim/nvim-lspconfig',
            config = 'require("plugins.nvim-lspconfig")',
            requires = {
                'https://github.com/ray-x/lsp_signature.nvim', -- lsp signature hint when you type
                'https://github.com/lspcontainers/lspcontainers.nvim', -- Neovim plugin for lspcontainers.
                'https://github.com/hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim builtin LSP client
                'https://github.com/nvim-telescope/telescope.nvim', -- Find, Filter, Preview, Pick. All lua, all the time.
            }
        } -- This plugin handles automatically launching, initializing, and configuring language servers that are installed on your system.
        use {
            'https://github.com/jose-elias-alvarez/null-ls.nvim',
            config = 'require("plugins.null-ls-nvim")',
        } -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
        use {
            'https://github.com/j-hui/fidget.nvim',
            config = 'require("plugins.fidget-nvim")',
        } -- Standalone UI for nvim-lsp progress


        -- *****************************************
        -- Database
        -- *****************************************
        use 'https://github.com/tpope/vim-dadbod' -- Dadbod is a Vim plugin for interacting with databases.
        use {
            'https://github.com/kristijanhusak/vim-dadbod-completion',
            ft = { 'sql', 'mysql' },
            config = 'require("plugins.vim-dadbod-completion")',
            requires = {
                'https://github.com/tpope/vim-dadbod', -- Dadbod is a Vim plugin for interacting with databases.
                'https://github.com/hrsh7th/nvim-cmp', -- A completion plugin for neovim coded in Lua.
            }
        } -- Database auto completion powered by vim-dadbod.
        use {
            'https://github.com/kristijanhusak/vim-dadbod-ui',
            opt = true,
            cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIRenameBuffer', 'DBUIFindBuffer', 'DBUILastQueryInfo' },
            keys = { '<F5>', '<Leader><F5>' },
            config = 'require("plugins.vim-dadbod-ui")',
            requires = {
                'https://github.com/tpope/vim-dadbod', -- Dadbod is a Vim plugin for interacting with databases.
            }
        } -- Simple UI for vim-dadbod. It allows simple navigation through databases and allows saving queries for later use.


        -- *****************************************
        -- Testing & debugging
        -- *****************************************
        use {
            'https://github.com/rcarriga/neotest',
            config = 'require("plugins.neotest")',
            requires = {
                'https://github.com/nvim-lua/plenary.nvim', -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
                'https://github.com/nvim-treesitter/nvim-treesitter', -- Nvim Treesitter configurations and abstraction layer
                'https://github.com/antoinemadec/FixCursorHold.nvim', -- Fix CursorHold Performance.
                'https://github.com/nvim-neotest/neotest-go', -- This plugin provides a go(lang) adapter for the Neotest framework.
            }
        } -- An extensible framework for interacting with tests within NeoVim.
        use {
            'https://github.com/sebdah/vim-delve',
        } -- Neovim / Vim integration for Delve
    end
}
