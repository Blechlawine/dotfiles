--- @type LazySpec
return {
    "neovim/nvim-lspconfig",
    lazy = false,
    -- init = function()
    --     require("core.utils").lazy_load_plugin("nvim-lspconfig")
    -- end,
    -- opts = {
    --     inlay_hints = { enabled = true },
    -- },
    dependencies = {
        -- Useful status updates for LSP.
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', tag = "v1.0.0", opts = {} },
        "mason-org/mason-lspconfig.nvim",
    },
    config = function(_, _)
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
                -- Disabled, because the lsp formatting produces garbage
                -- map("<leader>lf", vim.lsp.buf.format, "Format buffer")
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

        require("mason-lspconfig").setup({
            automatic_enable = true,
            ensure_installed = {
                "lua_ls",
                "vue_ls",
                "vtsls",
                "htmx",
                "biome",
                "cssls",
                "astro",
                "taplo",
                "jsonls",
                "html",
                "emmet_ls",
                "tailwindcss",
                "rust_analyzer"
            },
        })

        vim.lsp.config("rust_analyzer", {
            settings = {
                ["rust-analyzer"] = {
                    check = {
                        command = "clippy",
                    },
                    -- rustfmt = {
                    --     overrideCommand = { "leptosfmt", "--config-file", "~/.config/nvim/leptosfmt.toml", "--stdin", "--rustfmt" } -- this doesnt work yet for some reason (it only works without the config file)
                    -- }
                },
            },
            capabilities = {
                textDocument = {
                    completion = {
                        completionItem = {
                            snippetSupport = false
                        }
                    }
                }
            }
        })

        vim.lsp.config("tailwindcss", {
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
                            -- [=["view!\\[\"([^\\]]+)\"\\]"]=],
                            -- 'view!\\["([^\\]]+)"\\]',
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
        })

        vim.lsp.config("emmet_ls", {
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
            init_options = {
                jsx = {
                    options = {
                        ["markup.attributes"] = {
                            class = "class",
                        }
                    }
                }
            }
        })

        vim.lsp.config("jsonls", {
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
        })

        vim.lsp.config("volar", {})

        vim.lsp.config("vtsls", {
            settings = {
                vtsls = {
                    tsserver = {
                        experimental = {
                            enableProjectDiagnostics = true
                        },
                        globalPlugins = {
                            {
                                name = "@vue/typescript-plugin",
                                location = vim.fn.expand("$MASON/packages") ..
                                    "/vue-language-server" .. '/node_modules/@vue/language-server',
                                languages = { "vue" },
                                configNamespace = "typescript",
                                enableForWorkspaceTypescriptVersions = true,
                            },
                        },
                    }
                }
            },
            filetypes = {
                "typescript",
                "javascript",
                "typescriptreact",
                "javascriptreact",
                "vue",
            },
        })

        vim.lsp.config("htmx", {
            filetypes = {
                "html",
                "hbs",
                -- "rust", -- Disable in rust files because it breaks rust_analyzer hover
                "templ",
            },
        })

        vim.lsp.config("gleam", {})
    end,
}
