return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    cmd = {
        "Neotree"
    },
    init = function()
        vim.g.neo_tree_remove_legacy_commands = true
    end,
    config = function(_, opts)
        require("neo-tree").setup(opts)
    end,
    opts = {
        close_if_last_window = true,
    }
}
