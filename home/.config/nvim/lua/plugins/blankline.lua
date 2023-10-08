return {
    "lukas-reineke/indent-blankline.nvim",
    init = function()
        require("core.utils").lazy_load_plugin("indent-blankline.nvim")
    end,
    opts = {
        exclude = {
            filetypes = {
                "help",
                "terminal",
                "checkhealth",
                "lazy",
                "gitcommit",
                "lspinfo",
                "man",
                "TelescopePrompt",
                "TelescopeResults",
                "mason",
                "",
            },
        },
    },
    config = function(_, opts)
        require("ibl").setup(opts)
    end,
}
