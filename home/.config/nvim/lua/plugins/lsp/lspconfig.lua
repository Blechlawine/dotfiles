return {
    "neovim/nvim-lspconfig",
    lazy = false,
    init = function()
        require("core.utils").lazy_load_plugin("nvim-lspconfig")
    end,
    opts = {},
    dependencies = {
        {
            -- neodev for neovim lua development
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
    },
    config = function()
    end,
}
