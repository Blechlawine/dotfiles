return {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "v" },
    init = function()
        vim.o.timeoutlen = 0
        vim.o.timeout = true
    end,
    opts = {},
    config = function(_, opts)
        require("which-key").setup(opts)
        require("core.utils").which_key_register()
    end,
}
