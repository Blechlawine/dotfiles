return {
    "nvim-treesitter/nvim-treesitter",
    init = function()
        require("core.utils").lazy_load_plugin("nvim-treesitter")
    end,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash",
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
            "toml",
        },

        highlight = {
            enable = true,
            use_languagetree = true,
        },

        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
        vim.treesitter.language.register("go", "templ")
    end,
}
