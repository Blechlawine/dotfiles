--- @type LazySpec[]
return {
    "nvim-lua/plenary.nvim",
    require("plugins.theme"),
    {
        "rcarriga/nvim-notify",
        lazy = false,
        opts = {
            max_width = 90,
            max_height = 20,
        },
        init = function(_)
            vim.notify = require("notify")
        end
    },

    -- neoconf for project specific configuration (this needs to run before lsp setups)
    {
        "folke/neoconf.nvim",
        lazy = false,
        opts = {},
    },
    -- which-key for keybindings, needs to run before creating mappings
    require("plugins.which-key"),

    -- For highlighting colors like #FF0000
    -- {
    --     "NvChad/nvim-colorizer.lua",
    --     init = function()
    --         require("core.utils").lazy_load_plugin("nvim-colorizer.lua")
    --     end,
    --     config = function(_, opts)
    --         require("colorizer").setup(opts)

    --         -- execute colorizer as soon as possible
    --         vim.defer_fn(function()
    --             require("colorizer").attach_to_buffer(0)
    --         end, 0)
    --     end,
    -- },
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

    {
        "mbbill/undotree",
        lazy = false,
        init = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
        end,
    },

    -- lsp
    require("plugins.mason"),
    require("plugins.lspconfig"),
    require("plugins.hover"),
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        opts = {
            modes = {
                with_preview = {
                    mode = "diagnostics",
                    preview = {
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.3,
                    },
                },
            },
        },
    },

    -- show crate version in cargo.toml
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        tag = "v0.4.0",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            src = {
                cmp = {
                    enabled = true,
                },
            },
        },
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

    -- Collection of small independent plugins/modules
    {
        "echasnovski/mini.nvim",
        version = false,
        lazy = false,
        config = function()
            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require("mini.surround").setup()
            require("mini.bracketed").setup()

            local hipatterns = require("mini.hipatterns")
            hipatterns.setup({
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })

            -- ... and there is more!
            --  Check out: https://github.com/echasnovski/mini.nvim
        end,
    },

    require("plugins.git"),

    -- For TSX syntax highlighting
    {
        "peitalin/vim-jsx-typescript",
        event = "BufRead .tsx", -- load on opening .tsx files
        opts = {},
    },

    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {},
    },

    -- autocompletion
    require("plugins.cmp"),

    require("plugins.wilder"),

    require("plugins.lualine"),
    {
        "Bekaboo/dropbar.nvim",
        lazy = false,
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        opts = {},
    },

    {
        "stevearc/dressing.nvim",
        lazy = false,
        -- The default config here is good
    },

    -- AI code completion, disabled because it makes programming boring
    -- {
    --     "Exafunction/codeium.vim",
    --     lazy = false,
    --     config = function(_, _)
    --         -- Disable default keybindings of codeium
    --         vim.g.codeium_disable_bindings = 1
    --     end
    -- },
}
