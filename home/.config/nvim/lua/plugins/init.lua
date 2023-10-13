local plugins = {
    "nvim-lua/plenary.nvim",
    -- {
    --     "navarasu/onedark.nvim",
    --     lazy = false,
    --     init = function()
    --         require("onedark").load()
    --     end
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        init = function()
            require("tokyonight").setup({
                style = "night"
            })
            require("tokyonight").load()
        end
    },
    {
        "lunarvim/horizon.nvim",
        lazy = false,
        init = function()
            require("horizon").setup({})
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
    -- harpoon for quick navigation
    require("plugins.harpoon"),

    -- lsp
    require("plugins.lsp"),

    {
        "stevearc/conform.nvim",
        lazy = false,
        opts = {
            formatters_by_ft = {
                javascript = { "biome" },
                typescript = { "biome" },
                json = { "biome" },
                lua = { "stylua" }
            },
            format_on_save = {
                timeout_ms = 1000,
                lsp_fallback = true,
            },
        },
        config = function(_, opts)
            require("conform").setup(opts)
        end,
    },

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
        event = "BufRead .tsx", -- load on opening .tsx files
        config = function(_, opts)
            require("jsx-typescript").setup(opts)
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    },

    -- autocompletion
    require("plugins.cmp"),

    require("plugins.which-key"),
    require("plugins.wilder"),

    require("plugins.lualine"),
    require("plugins.bufferline"),

    {
        "Exafunction/codeium.vim",
        lazy = false,
    },
}

require("lazy").setup(plugins, require("plugins.config.lazy"))
