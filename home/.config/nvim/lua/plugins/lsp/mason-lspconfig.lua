return {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function(_, opts)
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup(opts)
        -- capabilities tell the lsp what parts of the lsp spec the editor can perform
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
        local on_attach = function(_, bufnr)
            local options = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, options)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, options)
            vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol("") end, options)
            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, options)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, options)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, options)
            vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, options)
            vim.keymap.set("n", "<leader>lu", function() vim.lsp.buf.references() end, options)
            vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, options)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, options)
        end
        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            volar = function()
                local volar_filetypes = {
                    "vue"
                }
                if not require("core.utils").is_npm_package_installed("vue") then
                    volar_filetypes = {
                        "vue",
                        "typescript",
                        "javascript",
                    }
                end
                require("lspconfig").volar.setup({
                    filetypes = volar_filetypes,
                    capabilities = capabilities,
                    on_attach = on_attach,
                    on_new_config = function(new_config, new_root_dir)
                        new_config.init_options.typescript.tsdk = require("core.utils").get_typescript_server_path(
                            new_root_dir)
                    end,
                })
            end,
            tsserver = function()
                if not require("core.utils").is_npm_package_installed("vue") then
                    require("lspconfig").tsserver.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
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
                    })
                end
            end,
            emmet_ls = function()
                require("lspconfig").emmet_ls.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    filetypes = {
                        "html",
                        "vue",
                        "css",
                        "handlebars",
                        "scss",
                        "typescriptreact",
                        "svelte",
                        "rust",
                    },
                })
            end,
            jsonls = function()
                require("lspconfig").jsonls.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
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
            end,
            rust_analyzer = function()
                require("lspconfig").rust_analyzer.setup({
                    settings = {
                        ["rust-analyzer"] = {
                            check = {
                                command = "clippy",
                            },
                        },
                    },
                })
            end,
        })
    end,
    opts = {
        ensure_installed = {
            "lua_ls",
            "rust_analyzer",
            "eslint",
            "tailwindcss",
            "emmet_ls",
            "tsserver",
            "html",
            "jsonls",
            "volar",
            "svelte",
            "biome",
            "prismals",
            "cssls",
            "astro",
            "templ",
            "gopls",
            "taplo",
        },
    },
}
