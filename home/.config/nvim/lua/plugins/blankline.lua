--- @type LazySpec
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    init = function()
        require("core.utils").lazy_load_plugin("indent-blankline.nvim")
    end,
    --- @module "ibl"
    --- @type ibl.config
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
}
