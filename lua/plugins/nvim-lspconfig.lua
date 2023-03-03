-- *****************************************
-- LanguageServer and Diagnostics
-- *****************************************
return {
    {
        -- This plugin handles automatically launching, initializing, and configuring language servers that are installed on your system.
        'https://github.com/neovim/nvim-lspconfig',
        dependencies = {
            'https://github.com/ray-x/lsp_signature.nvim', -- lsp signature hint when you type
            'https://github.com/lspcontainers/lspcontainers.nvim', -- Neovim plugin for lspcontainers.
            'https://github.com/hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim builtin LSP client
            'https://github.com/nvim-telescope/telescope.nvim', -- Find, Filter, Preview, Pick. All lua, all the time.
        },
        config = function()
            local lspconfig = require('lspconfig')
            local configs = require('lspconfig.configs')
            local lsp_signature = require('lsp_signature')
            local lspcontainers = require('lspcontainers')
            local cmp_nvim_lsp = require('cmp_nvim_lsp')
            local is_work = require("utils").is_work

            -- Set log level
            -- Levels by name: "trace", "debug", "info", "warn", "error"
            -- vim.lsp.set_log_level("trace")

            -- Diagnostic configuration
            --
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = false,
            })

            -- Set diagnostic symbols
            local signs = { Error = "", Warn = "", Hint = "", Info = "" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            local lspFormattingAugroup = vim.api.nvim_create_augroup("LspFormatting", {})
            local on_attach = function(client, bufnr)
                lsp_signature.on_attach({
                    bind = true,
                    hint_enable = false,
                })

                -- Always use autoindent
                -- php workaround, see https://vi.stackexchange.com/questions/11023/auto-indent-turns-off-itself-automatically-on-php-files
                vim.api.nvim_buf_set_option(bufnr, "indentexpr", "")
                vim.api.nvim_buf_set_option(bufnr, "autoindent", true)
                vim.api.nvim_buf_set_option(bufnr, "smartindent", true)

                -- Keybindings for LSPs
                local opts = { noremap = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<S-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd",
                    ":lua require('telescope.builtin').lsp_definitions{}<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi",
                    ":lua require('telescope.builtin').lsp_implementations{}<CR>",
                    opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gt",
                    ":lua require('telescope.builtin').lsp_type_definitions{}<CR>"
                    , opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gr",
                    ":lua require('telescope.builtin').lsp_references{}<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>o",
                    ":lua require('telescope.builtin').lsp_document_symbols{}<CR>",
                    opts)

                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

                -- telescope does a better job at this:
                -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)

                -- Diagnostics
                vim.api.nvim_buf_set_keymap(bufnr, "n", "[c", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "]c", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

                -- Set some keybinds conditional on server capabilities
                if client.server_capabilities.document_formatting then
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gf", "<cmd>lua vim.lsp.buf.format()<CR>",
                        opts)
                elseif client.server_capabilities.document_range_formatting then
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
                        opts)
                end

                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = lspFormattingAugroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = lspFormattingAugroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            vim.lsp.buf.format()
                        end,
                    })
                end

                -- Set autocommands conditional on server_capabilities
                if client.server_capabilities.document_highlight then
                    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]               , false)
                end
            end

            if not configs.tilt then
                configs.tilt = {
                    default_config = {
                        cmd = { "tilt", "lsp", "start" },
                        filetypes = { 'tilt.config' },
                        root_dir = function(fname)
                            return lspconfig.util.root_pattern("Tiltfile")(fname)
                        end,
                        single_file_support = true,
                    },
                    docs = {
                        description = [[
https://docs.tilt.dev/cli/tilt_lsp_start.html
tilt.dev Starlark LSP server.
]]                       ,
                        default_config = {
                            root_dir = [[root_pattern("Tiltfile")]],
                        },
                    },
                }
            end

            local servers = {
                -- nil_ls = {},
                rnix = {},
                vimls = {},
                bashls = {},
                dockerls = {},
                html = {},
                cssls = {},
                jsonls = {},
                tsserver = {},
                yamlls = {},
                tailwindcss = {
                    filetypes = { "go", "gohtml", "html", "markdown", "php", "css", "less", "sass", "scss", "javascript",
                        "javascriptreact", "typescript", "typescriptreact", "vue" },
                },
                terraformls = {
                    filetypes = { "hcl", "tf", "terraform", "tfvars" },
                },
                gopls = {
                    cmd = { "gopls" },
                    filetypes = { "go", "gomod" },
                    root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
                    -- cmd = lspcontainers.command('gopls'),
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                            },
                            staticcheck = true,
                            ["formatting.gofumpt"] = not is_work,
                        },
                    },
                },
                pylsp = {
                    -- cmd = lspcontainers.command('pylsp'),
                },
                rust_analyzer = {
                    -- cmd = lspcontainers.command('rust_analyzer'),
                },
                vuels = {
                    before_init = function(params)
                        params.processId = vim.NIL
                    end,
                    cmd = lspcontainers.command('vuels'),
                    root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
                },
                lua_ls = {
                    -- cmd = lspcontainers.command('sumneko_lua'),
                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                                -- Setup your lua path
                                path = vim.split(package.path, ';'),
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { 'vim' },
                            },
                            workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = {
                                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                                },
                            },
                            -- Do not send telemetry data containing a randomized but unique identifier
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
                intelephense = {
                    -- before_init = function(params)
                    --   params.processId = vim.NIL
                    -- end,
                    -- cmd = lspcontainers.command('intelephense'),
                    root_dir = lspconfig.util.root_pattern("composer.json", ".git", vim.fn.getcwd()),
                    init_options = {
                        licenceKey = "${config.xdg.configHome}/intelephense/license.txt",
                        -- clearCache = true
                    },
                    settings = {
                        intelephense = {
                            environment = {
                                includePaths = {
                                    "${config.home.homeDirectory}/.composer/vendor",
                                }
                            }
                        }
                    }
                },
                tilt = {
                    root_dir = lspconfig.util.root_pattern("Tiltfile", vim.fn.getcwd()),
                },
            }

            local capabilities = cmp_nvim_lsp.default_capabilities()
            for server, config in pairs(servers) do
                config.on_attach = on_attach

                -- don't mess with helm templates
                if server == "yamlls" then
                    config.on_attach = function(client, bufnr)
                        if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
                            vim.diagnostic.disable(bufnr)
                            vim.defer_fn(function()
                                vim.diagnostic.reset(nil, bufnr)
                            end, 1000)
                        end
                        on_attach(client, bufnr)
                    end
                end

                config.log_level = vim.lsp.protocol.MessageType.Error
                config.message_level = vim.lsp.protocol.MessageType.Log;
                config.capabilities = capabilities

                lspconfig[server].setup(config)
            end
        end,
    },
}
