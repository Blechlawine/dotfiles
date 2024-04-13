return {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash",
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
            "lua",
            "luadoc",
            "markdown",
            "vim",
            "vimdoc",
        },
        auto_install = true,
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
