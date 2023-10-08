return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            lazy = false
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            enabled = vim.fn.executable("make") == 1,
            build = "make"
        },
    },
    cmd = "Telescope",
    opts = {
        pickers = {
            find_files = {
                hidden = true,
            },
            live_grep = {
                hidden = true,
            },
        },
        defaults = {
            file_ignore_patterns = {
                ".git",
                "node_modules",
                "target"
            },
            path_display = { "truncate" },
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
        },
    },
    config = function(_, opts)
        require("telescope").setup(opts)
    end,
}
