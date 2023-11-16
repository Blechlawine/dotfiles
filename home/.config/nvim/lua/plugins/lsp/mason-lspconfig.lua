return {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)
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
