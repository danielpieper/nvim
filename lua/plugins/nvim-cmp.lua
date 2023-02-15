-- *****************************************
-- Completion
-- *****************************************
return {
    {
        -- A completion plugin for neovim coded in Lua.
        'https://github.com/hrsh7th/nvim-cmp',
        dependencies = {
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
        },
        config = function()
            local c = require("colors")
            local cmp = require('cmp')
            local luasnip = require("luasnip")

            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                mapping = {
                    -- ['<C-n>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-p>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    -- ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                window = {
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                    },
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry,
                            vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. strings[1] .. " "
                        if entry.source.name == "nvim_lsp" then
                            kind.menu = "    (" .. strings[2] .. ")"
                        else
                            kind.menu = ({
                                luasnip = "    [Snippet]",
                                buffer = "    [Buffer]",
                                path = "    [Path]",
                                calc = "    [Calc]",
                                nvim_lua = "    [Lua]",
                                emoji = "    [Emoji]",
                                ['vim-dadbod-completion'] = "    [DB]",
                            })[entry.source.name]
                        end

                        return kind
                    end,
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'calc' },
                    { name = 'nvim_lua' },
                    { name = 'emoji' },
                }),
            })

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'nvim_lsp_document_symbol' }
                }, {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            local highlights = {
                -- :so $VIMRUNTIME/syntax/hitest.vim

                PmenuSel = { bg = "#282C34", fg = "NONE" },
                Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

                -- PmenuSel = { bg = c.base03, fg = "none" },
                -- Pmenu = { fg = c.base07, bg = c.base01 },

                CmpItemAbbrDeprecated = { fg = c.base03, bg = "none", strikethrough = true },
                CmpItemAbbrMatch = { fg = c.base0D, bg = "none", bold = true },
                CmpItemAbbrMatchFuzzy = { fg = c.base0D, bg = "none", bold = true },
                CmpItemMenu = { fg = c.base0A, bg = "none", italic = true },

                CmpItemKindField = { fg = c.base01, bg = c.base0E },
                CmpItemKindProperty = { fg = c.base01, bg = c.base0E },
                CmpItemKindEvent = { fg = c.base01, bg = c.base0E },

                CmpItemKindText = { fg = c.base01, bg = c.base0B },
                CmpItemKindEnum = { fg = c.base01, bg = c.base0B },
                CmpItemKindKeyword = { fg = c.base01, bg = c.base0B },

                CmpItemKindConstant = { fg = c.base01, bg = c.base08 },
                CmpItemKindConstructor = { fg = c.base01, bg = c.base08 },
                CmpItemKindReference = { fg = c.base01, bg = c.base08 },

                CmpItemKindFunction = { fg = c.base01, bg = c.base0A },
                CmpItemKindStruct = { fg = c.base01, bg = c.base0A },
                CmpItemKindClass = { fg = c.base01, bg = c.base0A },
                CmpItemKindModule = { fg = c.base01, bg = c.base0A },
                CmpItemKindOperator = { fg = c.base01, bg = c.base0A },

                CmpItemKindVariable = { fg = c.base01, bg = c.base04 },
                CmpItemKindFile = { fg = c.base01, bg = c.base04 },

                CmpItemKindUnit = { fg = c.base01, bg = c.base09 },
                CmpItemKindSnippet = { fg = c.base01, bg = c.base09 },
                CmpItemKindFolder = { fg = c.base01, bg = c.base09 },

                CmpItemKindMethod = { fg = c.base01, bg = c.base0D },
                CmpItemKindValue = { fg = c.base01, bg = c.base0D },
                CmpItemKindEnumMember = { fg = c.base01, bg = c.base0D },

                CmpItemKindInterface = { fg = c.base01, bg = c.base0C },
                CmpItemKindColor = { fg = c.base01, bg = c.base0C },
                CmpItemKindTypeParameter = { fg = c.base01, bg = c.base0C },
            }

            for name, hi in pairs(highlights) do
                vim.api.nvim_set_hl(0, name, hi)
            end

            vim.api.nvim_create_autocmd("Colorscheme", {
                callback = function()
                    for name, hi in pairs(highlights) do
                        vim.api.nvim_set_hl(0, name, hi)
                    end
                end,
            })
        end,
    },
}
