return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            -- TODO: fix catppuccin theme for lualine
            theme = "catppuccin"
        },
    },
    config = function(_, opts)
        require("lualine").setup(opts)
    end
}
