return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- snippet plugin
        {
            "L3MON4D3/LuaSnip",
            dependencies = "rafamadriz/friendly-snippets",
            opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            config = function(_, opts)
                require("luasnip").config.set_config(opts)

                -- vscode format
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_vscode").lazy_load({
                    paths = {
                        "~/AppData/Roaming/Code/User/snippets",
                        "~/.config/Code/User/snippets",
                    }
                })

                vim.api.nvim_create_autocmd("InsertLeave", {
                    callback = function()
                        if
                            require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                            and not require("luasnip").session.jump_active
                        then
                            require("luasnip").unlink_current()
                        end
                    end,
                })
            end,
        },
        -- autopairing of (){}[] etc
        {
            "windwp/nvim-autopairs",
            opts = {
                fast_wrap = {},
                disable_filetype = { "TelescopePrompt", "vim" },
            },
            config = function(_, opts)
                require("nvim-autopairs").setup(opts)

                -- setup cmp for autopairs
                local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end,
        },
        -- autocomplete sources
        {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
    },
    opts = {},
    config = function(_, opts)
        require("cmp").setup(opts)
    end
}
