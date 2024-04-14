return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            theme = "onedark_dark"
        },
        sections = {
            lualine_c = {
                {
                    "filename",
                    path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                }
            },
        },
    },
    config = function(_, opts)
        require("lualine").setup(opts)
    end
}
