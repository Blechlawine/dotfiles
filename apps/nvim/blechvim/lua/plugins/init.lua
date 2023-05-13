local plugins = {
    "nvim-lua/plenary.nvim",
    {
        "navarasu/onedark.nvim",
        lazy = false,
        init = function()
            require("onedark").load()
        end
    },

    {
        "NvChad/nvim-colorizer.lua",
        init = function()
            require("core.utils").lazy_load_plugin("nvim-colorizer.lua")
        end,
        config = function(_, opts)
            require("colorizer").setup(opts)

            -- execute colorizer as soon as possible
            vim.defer_fn(function()
                require("colorizer").attach_to_buffer(0)
            end, 0)
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = {},
        config = function(_, opts)
            require("nvim-web-devicons").setup(opts)
        end,
    },
    -- blankline for indent-guides
    require("plugins.blankline"),

    require("plugins.treesitter"),

    -- telescope for fuzzy finding
    require("plugins.telescope"),
    -- neo-tree as a file explorer sidebar
    require("plugins.neo-tree"),

    -- lsp
    require("plugins.lsp"),

    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git"
        }
    },
    -- For TSX syntax highlighting
    {
        "peitalin/vim-jsx-typescript",
        -- TODO: when should this load?
    },

    {
        "numToStr/Comment.nvim",
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    },

    -- autocompletion
    require("plugins.cmp"),

    -- {
    --     "folke/which-key.nvim",
    --     keys = { "<leader>", '"', "'", "`", "c", "v" },
    --     opts = {},
    --     config = function(_, opts)
    --         require("which-key").setup(opts)
    --         require("core.utils").which_key_register()
    --     end,
    -- },
    require("plugins.wilder"),

    require("plugins.lualine"),
    require("plugins.bufferline"),
}

require("lazy").setup(plugins, require("plugins.config.lazy"))
