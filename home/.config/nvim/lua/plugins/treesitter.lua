--- @type LazySpec
return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        branch = "master",
        opts = {
            auto_install = true,
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = { enable = true },
            ensure_installed = {
                "astro",
                "bash",
                "css",
                "go",
                "html",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "rust",
                "svelte",
                "toml",
                "typescript",
                "vim",
                "vimdoc",
                "vue",
                "yaml",
            }
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
            vim.treesitter.language.register("go", "templ")
        end,
    },
    {
        "rayliwell/tree-sitter-rstml",
        lazy = false,
        dependencies = {
            "nvim-treesitter",
        },
        build = ":TSUpdate",
        config = function()
            require("tree-sitter-rstml").setup()
        end
    }
}
