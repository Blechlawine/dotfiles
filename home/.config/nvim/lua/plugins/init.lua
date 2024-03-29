local plugins = {
    "nvim-lua/plenary.nvim",
    -- {
    --     "navarasu/onedark.nvim",
    --     lazy = false,
    --     init = function()
    --         require("onedark").load()
    --     end
    -- },
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     init = function()
    --         require("tokyonight").setup({
    --             style = "night"
    --         })
    --         require("tokyonight").load()
    --     end
    -- },
    require("plugins.theme"),
    -- {
    --     "catppuccin/nvim",
    --     lazy = false,
    --     priority = 100,
    --     name = "catppuccin",
    --     init = function()
    --         require("catppuccin").setup({
    --             flavour = "mocha",
    --             integrations = {
    --                 mason = true,
    --                 harpoon = true,
    --                 which_key = true,
    --                 telescope = {
    --                     enabled = true,
    --                     style = "nvchad",
    --                 },
    --                 dropbar = {
    --                     enabled = true,
    --                 },
    --             },
    --         })
    --         require("catppuccin").load()
    --     end
    -- },
    -- {
    --     "lunarvim/horizon.nvim",
    --     lazy = false,
    --     init = function()
    --         require("horizon").setup({})
    --     end
    -- },
    {
        "rcarriga/nvim-notify",
        lazy = false,
        init = function()
            vim.notify = require("notify")
        end
    },

    -- neoconf for project specific configuration (this needs to run before lsp setups)
    {
        "folke/neoconf.nvim",
        lazy = false,
        init = function(opts)
            require("neoconf").setup(opts)
        end
    },

    -- For highlighting colors like #FF0000
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
    require("plugins.icons"),
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
    require("plugins.mason"),
    require("plugins.lsp.mason-lspconfig"),
    require("plugins.lsp.lspconfig"),
    require("plugins.hover"),
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({})
        end,
    },

    -- show crate version in cargo.toml
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        tag = "v0.4.0",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("crates").setup({
                src = {
                    cmp = {
                        enabled = true,
                    },
                },
            })
        end,
    },

    -- For easy control over formatters
    {
        "stevearc/conform.nvim",
        lazy = false,
        opts = {
            formatters_by_ft = {
                javascript = { "biome" },
                typescript = { "biome" },
                json = { "biome" },
                lua = { "stylua" },
                vue = { "prettierd" },
            },
            formatters = {
                prettierd = {
                    env = {
                        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/.prettierrc.json"),
                    },
                },
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
        },
    },
    -- For TSX syntax highlighting
    {
        "peitalin/vim-jsx-typescript",
        event = "BufRead .tsx", -- load on opening .tsx files
        config = function(_, opts)
            require("jsx-typescript").setup(opts)
        end,
    },

    -- {
    --     "numToStr/Comment.nvim",
    --     config = function(_, opts)
    --         require("Comment").setup(opts)
    --     end,
    -- },

    -- autocompletion
    require("plugins.cmp"),

    require("plugins.which-key"),
    require("plugins.wilder"),

    require("plugins.lualine"),
    require("plugins.bufferline"),
    --    {
    --        "Bekaboo/dropbar.nvim",
    --        lazy = false,
    --        dependencies = {
    --            "nvim-telescope/telescope-fzf-native.nvim",
    --        },
    --        config = function(_, opts)
    --            require("dropbar").setup(opts)
    --        end
    --    },

    -- AI code completion
    {
        "Exafunction/codeium.vim",
        lazy = false,
        config = function(_, _)
            -- Disable default keybindings of codeium
            vim.g.codeium_disable_bindings = 1
        end
    },
}

require("lazy").setup(plugins, require("plugins.config.lazy"))
