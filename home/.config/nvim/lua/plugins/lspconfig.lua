return {
    "neovim/nvim-lspconfig",
    lazy = false,
    init = function()
        require("core.utils").lazy_load_plugin("nvim-lspconfig")
    end,
    opts = {
        inlay_hints = { enabled = true },
    },
    dependencies = {
        -- Useful status updates for LSP.
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', tag = "v1.0.0", opts = {} },
        {
            -- neodev for neovim lua development
            "folke/neodev.nvim",
            lazy = false,
            opts = {
                library = {
                    enabled = true,
                    runtime = true,
                    types = true,
                    plugins = true,
                },
            },
            config = function(_, opts)
                require("neodev").setup(opts)
            end,
        },
        "williamboman/mason-lspconfig.nvim",
    },
    config = function(_, opts)
        --  This function gets run when an LSP attaches to a particular buffer.
        --    That is to say, every time a new file is opened that is associated with
        --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        --    function will be executed to configure the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                map("<leader>ld", vim.diagnostic.open_float, "Show diagnostics floating window")
                map("<leader>la", vim.lsp.buf.code_action, "Show code actions")
                map("<leader>lq", vim.diagnostic.setloclist, "Show diagnostics in location list")
                map("<leader>lu", require("telescope.builtin").lsp_references, "Show references")
                map("<leader>lr", vim.lsp.buf.rename, "Rename symbol")
                map("gd", require("telescope.builtin").lsp_definitions, "Go to definition")
                map("<leader>lh", vim.lsp.buf.signature_help, "Show signature help")
                map("]d", vim.diagnostic.goto_next, "Go to next diagnostic")
                map("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
                map("<leader>lf", vim.lsp.buf.format, "Format buffer")
                map(
                    "<leader>lD",
                    "<cmd>Trouble with_preview toggle focus=false<cr>",
                    "Toggle all diagnostics with trouble"
                )

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        -- configure LSP servers
        local servers = {
            lua_ls = {},
            rust_analyzer = {
                settings = {
                    ["rust-analyzer"] = {
                        check = {
                            command = "clippy",
                        },
                        rustfmt = {
                            -- overrideCommand = { "leptosfmt", "--config-file", "~/.config/nvim/leptosfmt.toml", "--stdin", "--rustfmt" } -- this doesnt work yet for some reason (it only works without the config file)
                        }
                    },
                },
            },
            tailwindcss = {
                filetypes = {
                    "html",
                    "css",
                    "scss",
                    "javascript",
                    "typescript",
                    "typescriptreact",
                    "javascriptreact",
                    "astro",
                    "svelte",
                    "vue",
                    "rust",
                    "templ",
                },
                settings = {
                    tailwindCSS = {
                        classAttributes = {
                            "class",
                            "className",
                            "classList",
                            "ngClass",
                            ":class",
                        },
                        emmetCompletions = true,
                        experimental = {
                            classRegex = {
                                [[class="([^"]*)]],
                                [[class: ?"([^"]*)]],
                                [[:class="([^"]*)]],
                                -- [[:ui=".*'([^']*)]], -- doesn't work
                                -- ":ui=\".*'([^']+).*", -- doesn't work

                                [["([^"]*)]],
                                -- [[class= "([^"]*)]],
                                -- [[class: "([^"]*)]],
                                -- '~H""".*class="([^"]*)".*"""',
                                [=["view!\\[\"([^\\]]+)\"\\]"]=],
                                'view!\\["([^\\]]+)"\\]',
                                -- [[class="([^"]*)]],
                                -- 'class=\\s+"([^"]*)',
                            },
                        },
                    },
                    includeLanguages = {
                        rust = "html",
                        ["*.rs"] = "html",
                        templ = "html",
                        ["*.templ"] = "html",
                    },
                },
            },
            emmet_ls = {
                filetypes = {
                    "html",
                    "vue",
                    "css",
                    "handlebars",
                    "scss",
                    "typescriptreact",
                    "javascriptreact",
                    "javascript",
                    "svelte",
                    "rust",
                    "templ",
                    "astro",
                },
            },
            ts_ls = {
                settings = {
                    tsserver = {
                        typescript = {
                            tsserver = {
                                experimental = {
                                    enableProjectDiagnostics = true,
                                },
                            },
                        },
                    },
                },
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = require("mason-registry").get_package("vue-language-server"):get_install_path() ..
                                "/node_modules/@vue/language-server",
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = {
                    "typescript",
                    "javascript",
                    "typescriptreact",
                    "javascriptreact",
                    "vue",
                },
            },
            html = {},
            jsonls = {
                settings = {
                    json = {
                        schemas = {
                            {
                                fileMatch = { "package.json" },
                                url = "https://json.schemastore.org/package.json",
                            },
                        },
                    },
                },
            },
            volar = {},
            svelte = {},
            biome = {},
            prismals = {},
            cssls = {},
            astro = {},
            templ = {},
            gopls = {},
            taplo = {},
            htmx = {
                filetypes = {
                    "html",
                    "hbs",
                    -- "rust", -- Disable in rust files because it breaks rust_analyzer hover
                    "templ",
                },
            },
        }
        local ensure_installed = vim.tbl_keys(servers or {})
        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    --  by the server configuration above. Useful when disabling
                    --  certain features of an LSP (for example, turning off formatting for tsserver)
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end
            }
        })
    end,
}
