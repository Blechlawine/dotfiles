return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    event = { "BufRead" },
    dependencies = {
        -- LSP Support
        {
            "neovim/nvim-lspconfig",
            lazy = false,
            init = function()
                require("core.utils").lazy_load_plugin("nvim-lspconfig")
            end,
            opts = {},
            config = function()
                -- fallback to global typescript installation when local one is not found
                local util = require 'lspconfig.util'
                local function get_typescript_server_path(root_dir)
                    local global_ts = '/home/marc/.npm/lib/node_modules/typescript/lib'
                    -- Alternative location if installed as root:
                    -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
                    local found_ts = ''
                    local function check_dir(path)
                        found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
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
                lspconfig.volar.setup({
                    -- filetypes = {
                    --     "vue",
                    --     "typescript",
                    --     "javascript",
                    -- },
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
            end,
        },
        require("plugins.mason"),
        {
            "williamboman/mason-lspconfig.nvim",
            lazy = false,
            config = function(_, opts)
                require("mason-lspconfig").setup(opts)
            end,
            opts = {},
        },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' },

        {
            "ray-x/lsp_signature.nvim",
            event = "BufRead",
            config = function()
                require("lsp_signature").setup()
            end,
        },
    },
    opts = {},
    config = function(_, opts)
        local lsp = require("lsp-zero")
        lsp.preset("recommended")
        lsp.ensure_installed({
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
            "gopls"
        })

        local cmp = require("cmp")
        cmp.setup({
            mapping = {
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<ESC>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false
                }),
            },
        })

        lsp.on_attach(function(client, bufnr)
            local options = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, options)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, options)
            vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, options)
            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, options)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, options)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, options)
            vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, options)
            vim.keymap.set("n", "<leader>lu", function() vim.lsp.buf.references() end, options)
            vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, options)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, options)
        end)
        lsp.setup()
    end,
}
