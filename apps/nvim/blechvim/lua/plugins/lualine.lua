return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            theme = "onedark"
        }
    },
    config = function(_, opts)
        require("lualine").setup(opts)
    end
}