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
        priority = 1000,
        lazy = false,
        opts = {},
    },
    {
        -- neodev for neovim lua development
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                "lazy.nvim",
                "LazyVim",
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    -- which-key for keybindings, needs to run before creating mappings
    require("plugins.which-key"),

    require("plugins.icons"),
    -- blankline for indent-guides
    require("plugins.blankline"),

    require("plugins.treesitter"),
    -- for autoclosing html tags
    {
        "windwp/nvim-ts-autotag",
        lazy = false,
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

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
    {
        -- for managing zettelkasten/obsidian notes
        "zk-org/zk-nvim",
        lazy = false,
        opts = {
            picker = "telescope",
        },
        config = function(_, opts)
            require("zk").setup(opts)
        end
    },
    -- require("plugins.hover"),
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
            completion = {
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
                css = { "biome" },
                json = { "biome" },
                jsonc = { "biome" },
                lua = { "stylua" },
                vue = { "prettier" },
            },
            formatters = {
                prettier = {
                    env = {
                        PRETTIER_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/.prettierrc.json"),
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
            require("mini.pick").setup()
            vim.ui.select = require("mini.pick").ui_select

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

    -- snippets
    require("plugins.snippets"),
    -- autocompletion
    require("plugins.cmp"),

    -- autopairing of (){}[] etc
    {
        "windwp/nvim-autopairs",
        lazy = false,
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        -- config = function(_, opts)
        --     require("nvim-autopairs").setup(opts)

        -- setup cmp for autopairs
        -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        -- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        -- end,
    },

    require("plugins.wilder"),

    require("plugins.lualine"),
    -- dropbar doesn't work on neovim 0.11.0
    -- {
    --     "Bekaboo/dropbar.nvim",
    --     lazy = false,
    --     dependencies = {
    --         "nvim-telescope/telescope-fzf-native.nvim",
    --     },
    --     opts = {},
    -- },

    {
        "folke/snacks.nvim",
        lazy = false,
        ---@module "snacks.nvim"
        ---@type snacks.Config
        opts = {
            lazygit = {},
            input = {},
            image = {},
            bigfile = {},
        }
    },
    {
        "supermaven-inc/supermaven-nvim",
        lazy = false,
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-y>",
                    clear_suggestion = "<C-n>",
                },
            })
        end
    },
}
