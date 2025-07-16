--- @type LazySpec
return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        branch = "main",
        opts = {
            auto_install = true,
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)
            require("nvim-treesitter").install({
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
            })
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
