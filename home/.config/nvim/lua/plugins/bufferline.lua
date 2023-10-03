return {
    "akinsho/bufferline.nvim",
    lazy = false,
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
        vim.opt.termguicolors = true
        require("bufferline").setup(opts)
    end
}
