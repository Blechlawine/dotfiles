--- @type LazySpec
return {
    "L3MON4D3/LuaSnip",
    -- dependencies = "rafamadriz/friendly-snippets",
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
}
