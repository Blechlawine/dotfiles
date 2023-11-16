return {
    "neovim/nvim-lspconfig",
    lazy = false,
    init = function()
        require("core.utils").lazy_load_plugin("nvim-lspconfig")
    end,
    opts = {},
    dependencies = {
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
        }
    },
    config = function()
        -- fallback to global typescript installation when local one is not found
        local util = require("lspconfig.util")
        local function get_typescript_server_path(root_dir)
            local global_ts = "/home/marc/.npm/lib/node_modules/typescript/lib"
            -- Alternative location if installed as root:
            -- local global_ts = "/usr/local/lib/node_modules/typescript/lib"
            local found_ts = ""
            local function check_dir(path)
                found_ts = util.path.join(path, "node_modules", "typescript", "lib")
                if util.path.exists(found_ts) then
                    return path
                end
            end
            if util.search_ancestors(root_dir, check_dir) then
                return found_ts
            else
                return global_ts
            end
        end

        local lspconfig = require("lspconfig")
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
        lspconfig.volar.setup({
            filetypes = volar_filetypes,
            on_new_config = function(new_config, new_root_dir)
                new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
            end,
        })

        lspconfig.emmet_ls.setup({
            filetypes = {
                "html",
                "vue",
                "css",
                "handlebars",
                "scss",
                "typescriptreact",
                "svelte",
            },
        })

        lspconfig.jsonls.setup({
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

        if not require("core.utils").is_npm_package_installed("vue") then
            lspconfig.tsserver.setup({})
        end

        lspconfig.lua_ls.setup({})
        lspconfig.rust_analyzer.setup({})
        lspconfig.tailwindcss.setup({})
        lspconfig.html.setup({})
        lspconfig.cssls.setup({})
        lspconfig.templ.setup({})
        lspconfig.gopls.setup({})
        lspconfig.biome.setup({})
        lspconfig.prismals.setup({})
        lspconfig.astro.setup({})
        lspconfig.eslint.setup({})
        lspconfig.svelte.setup({})
    end,
}
