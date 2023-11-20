return {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function(_, opts)
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup(opts)
        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup {}
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
                    on_new_config = function(new_config, new_root_dir)
                        new_config.init_options.typescript.tsdk = require("core.utils").get_typescript_server_path(
                            new_root_dir)
                    end,
                })
            end,
            tsserver = function()
                if not require("core.utils").is_npm_package_installed("vue") then
                    require("lspconfig").tsserver.setup({
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
            "gopls"
        },
    },
}
