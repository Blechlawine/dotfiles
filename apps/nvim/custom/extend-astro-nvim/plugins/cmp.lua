return {
    "hrsh7th/nvim-cmp",
    keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
    dependencies = {
        "hrsh7th/cmp-calc",
    },
    opts = function(_, opts)
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        return require("astronvim.utils").extend_tbl(opts, {
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 1000 },
                { name = "luasnip",  priority = 750 },
                { name = "buffer",   priority = 500 },
                { name = "path",     priority = 250 },
                { name = "calc",     priority = 200 },
            }),
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<Tab>"] = cmp.config.disable,
                -- TODO: Ctrl+Space doesn't seem to work currently, it still writes a space
                ["<C-Space>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            },
        })
    end,
}
