return {
    "folke/neodev.nvim",
    lazy = false,
    opts = {
        library = {
            enabled = true,
            runtime = true,
            types = true,
            plugins = true,
        },
    },
    config = function(_, opts)
        require("neodev").setup(opts)
    end,
}
