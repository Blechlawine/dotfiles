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
            opts = function()
            end,
            config = function()
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
            "rome",
            "prismals",
            "cssls",
            "astro"
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
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, options)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, options)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, options)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, options)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, options)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, options)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, options)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, options)
        end)
        lsp.setup()
    end,
}
