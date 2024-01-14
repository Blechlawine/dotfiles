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
                -- load snippets from plugins in vscode style
                require("luasnip.loaders.from_vscode").lazy_load()
                -- load custom snippets
                require("luasnip.loaders.from_vscode").lazy_load({
                    paths = {
                        "~/.config/nvim/snippets/vscode",
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
        {
            "David-Kunz/cmp-npm",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            ft = "json",
            config = function(_, opts)
                require("cmp-npm").setup(opts)
            end
        }
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = {
                { name = "npm",      keyword_length = 3 },
                { name = "luasnip",  keyword_length = 3 },
                { name = "nvim_lsp", keyword_length = 3 },
                { name = "crates",   keyword_length = 3 },
                { name = "buffer",   keyword_length = 3 },
                { name = "path",     keyword_length = 3 },
            },
            mapping = {
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<ESC>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false
                }),
                -- select completion with arrow keys
                ["<Down>"] = cmp.mapping.select_next_item(),
                ["<Up>"] = cmp.mapping.select_prev_item(),
            },
        })
    end
}
