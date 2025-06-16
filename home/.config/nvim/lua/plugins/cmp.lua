--- @type LazySpec
return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = { 'L3MON4D3/LuaSnip' },
    version = "1.*",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            preset = "enter",
        },
        snippets = {
            preset = "luasnip"
        },
        completion = {
            list = {
                selection = {
                    auto_insert = false,
                    preselect = false,
                },
            },
            -- Disable auto brackets
            -- NOTE: some LSPs may add auto brackets themselves anyway
            accept = {
                auto_brackets = { enabled = false },
            },
            -- Display a preview of the selected item on the current line
            ghost_text = { enabled = true },
            -- Show documentation when selecting a completion item
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
        },
        signature = {
            enabled = true,
        },
    },
}

-- return {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     dependencies = {
--         -- autocomplete sources
--         {
--             "saadparwaiz1/cmp_luasnip",
--             "hrsh7th/cmp-nvim-lua",
--             "hrsh7th/cmp-nvim-lsp",
--             "hrsh7th/cmp-buffer",
--             "hrsh7th/cmp-path",
--         },
-- {
--     "onsails/lspkind.nvim",
--     opts = {
--         symbol_map = {
--             Text = "",
--             Method = "",
--             Function = "󰊕",
--             Constructor = "",
--             Field = "",
--             Variable = "",
--             Class = "",
--             Interface = "",
--             Module = "",
--             Property = "",
--             Unit = "",
--             Value = "",
--             Enum = "",
--             Keyword = "",
--             Snippet = "",
--             Color = "",
--             File = "",
--             Reference = "",
--             Folder = "󰉋",
--             EnumMember = "",
--             Constant = "",
--             Struct = "",
--             Event = "",
--             Operator = "",
--             TypeParameter = "T",
--         },
--     },
-- },
--     },
--     config = function()
--         local cmp = require("cmp")
--         cmp.setup({
--             snippet = {
--                 expand = function(args)
--                     require("luasnip").lsp_expand(args.body)
--                 end,
--             },
--             sources = {
--                 { name = "nvim_lsp", keyword_length = 3, priority = 1000 },
--                 { name = "path",     keyword_length = 3, priority = 500 },
--                 -- { name = "npm",      keyword_length = 3, priority = 100 },
--                 { name = "crates",   keyword_length = 3, priority = 100 },
--                 { name = "luasnip",  keyword_length = 3, priority = 20 },
--                 -- { name = "buffer",   keyword_length = 3, priority = 10 },
--             },
--             mapping = {
--                 ["<C-Space>"] = cmp.mapping.complete(),
--                 ["<ESC>"] = cmp.mapping.abort(),
--                 ["<CR>"] = cmp.mapping.confirm({
--                     select = false
--                 }),
--                 -- select completion with arrow keys
--                 ["<Down>"] = cmp.mapping.select_next_item(),
--                 ["<Up>"] = cmp.mapping.select_prev_item(),
--                 ["<S-Down>"] = cmp.mapping.scroll_docs(4),
--                 ["<S-Up>"] = cmp.mapping.scroll_docs(-4),
--             },
--             window = {
--                 completion = {
--                     winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:PmenuSel",
--                     col_offset = -3,
--                     side_padding = 0,
--                 },
--             },
--             formatting = {
--                 expandable_indicator = false,
--                 fields = { "kind", "abbr", "menu" },
--                 format = function(entry, vim_item)
--                     local kind = require("lspkind").cmp_format({
--                         mode = "symbol_text",
--                         maxwidth = 50,
--                     })(entry, vim_item)
--                     local strings = vim.split(kind.kind, "%s", { trimempty = true })
--                     kind.kind = " " .. (strings[1] or "") .. " "
--                     kind.menu = "    (" .. (strings[2] or "") .. ")"
--
--                     return kind
--                 end,
--             },
--         })
--     end
-- }
