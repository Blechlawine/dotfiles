return {
    "akinsho/bufferline.nvim",
    lazy = false,
    init = function()
        vim.opt.termguicolors = true
    end,
    opts = {
        options = {
            hover = {
                enabled = true,
                delay = 200,
                reveal = { "close" },
            },
            offsets = {
                filetype = "neo-tree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true,
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
    end
}
