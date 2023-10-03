return {
    "nvim-treesitter/nvim-treesitter",
    init = function()
        require("core.utils").lazy_load_plugin("nvim-treesitter")
    end,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "lua",
            "html",
            "vue",
            "svelte",
            "astro",
            "css",
            "typescript",
            "yaml",
            "json",
            "rust",
            "go",
        },

        highlight = {
            enable = true,
            use_languagetree = true,
        },

        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
