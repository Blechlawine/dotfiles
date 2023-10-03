return {
    "lukas-reineke/indent-blankline.nvim",
    init = function()
        require("core.utils").lazy_load_plugin("indent-blankline.nvim")
    end,
    config = function()
        require("ibl").setup({
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
        })
    end,
}
