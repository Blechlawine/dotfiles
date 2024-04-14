return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    lazy = false,
    init = function()
        local color = require("onedarkpro.helpers")
        -- local colors = color.get_colors("onedark_dark")
        local cmpKindLightenAmount = 40

        require("onedarkpro").setup({
            styles = {
                types = "NONE",
                methods = "NONE",
                numbers = "NONE",
                strings = "NONE",
                comments = "italic",
                keywords = "bold,italic",
                constants = "NONE",
                functions = "italic",
                operators = "NONE",
                variables = "NONE",
                parameters = "NONE",
                conditionals = "italic",
                virtual_text = "NONE",
            },
            options = {
                cursorline = true,
                highlight_inactive_windows = true,
            },
            colors = {
                purple = "#A656AC",
                float_bg = color.lighten("bg", 8, "onedark_dark"),
                float_select = color.lighten("bg", 16, "onedark_dark"),
            },
            highlights = {
                NormalFloat = {
                    bg = "${float_bg}"
                },
                Pmenu = {
                    bg = "${float_bg}"
                },
                PmenuSel = {
                    bg = "${float_select}",
                },

                CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
                CmpItemAbbrMatch = { fg = "${blue}", bg = "NONE", bold = true },
                CmpItemAbbrMatchFuzzy = { fg = "${blue}", bg = "NONE", bold = true },
                CmpItemMenu = { fg = "${cyan}", bg = "NONE", italic = true },

                CmpItemKindField = { fg = color.lighten("red", cmpKindLightenAmount, "onedark_dark"), bg = "${red}" },
                CmpItemKindProperty = { fg = color.lighten("red", cmpKindLightenAmount, "onedark_dark"), bg = "${red}" },
                CmpItemKindEvent = { fg = color.lighten("red", cmpKindLightenAmount, "onedark_dark"), bg = "${red}" },

                CmpItemKindText = { fg = color.lighten("green", cmpKindLightenAmount, "onedark_dark"), bg = "${green}" },
                CmpItemKindEnum = { fg = color.lighten("green", cmpKindLightenAmount, "onedark_dark"), bg = "${green}" },
                CmpItemKindKeyword = { fg = color.lighten("green", cmpKindLightenAmount, "onedark_dark"), bg = "${green}" },

                CmpItemKindConstant = { fg = color.lighten("yellow", cmpKindLightenAmount, "onedark_dark"), bg = "${yellow}" },
                CmpItemKindConstructor = { fg = color.lighten("yellow", cmpKindLightenAmount, "onedark_dark"), bg = "${yellow}" },
                CmpItemKindReference = { fg = color.lighten("yellow", cmpKindLightenAmount, "onedark_dark"), bg = "${yellow}" },

                CmpItemKindFunction = { fg = color.lighten("purple", cmpKindLightenAmount, "onedark_dark"), bg = "${purple}" },
                CmpItemKindStruct = { fg = color.lighten("purple", cmpKindLightenAmount, "onedark_dark"), bg = "${purple}" },
                CmpItemKindClass = { fg = color.lighten("purple", cmpKindLightenAmount, "onedark_dark"), bg = "${purple}" },
                CmpItemKindModule = { fg = color.lighten("purple", cmpKindLightenAmount, "onedark_dark"), bg = "${purple}" },
                CmpItemKindOperator = { fg = color.lighten("purple", cmpKindLightenAmount, "onedark_dark"), bg = "${purple}" },

                CmpItemKindVariable = { fg = color.lighten("gray", cmpKindLightenAmount, "onedark_dark"), bg = "${gray}" },
                CmpItemKindFile = { fg = color.lighten("gray", cmpKindLightenAmount, "onedark_dark"), bg = "${gray}" },

                CmpItemKindUnit = { fg = color.lighten("orange", cmpKindLightenAmount, "onedark_dark"), bg = "${orange}" },
                CmpItemKindSnippet = { fg = color.lighten("orange", cmpKindLightenAmount, "onedark_dark"), bg = "${orange}" },
                CmpItemKindFolder = { fg = color.lighten("orange", cmpKindLightenAmount, "onedark_dark"), bg = "${orange}" },

                CmpItemKindMethod = { fg = color.lighten("blue", cmpKindLightenAmount, "onedark_dark"), bg = "${blue}" },
                CmpItemKindValue = { fg = color.lighten("blue", cmpKindLightenAmount, "onedark_dark"), bg = "${blue}" },
                CmpItemKindEnumMember = { fg = color.lighten("blue", cmpKindLightenAmount, "onedark_dark"), bg = "${blue}" },

                CmpItemKindInterface = { fg = color.lighten("cyan", cmpKindLightenAmount, "onedark_dark"), bg = "${cyan}" },
                CmpItemKindColor = { fg = color.lighten("cyan", cmpKindLightenAmount, "onedark_dark"), bg = "${cyan}" },
                CmpItemKindTypeParameter = { fg = color.lighten("cyan", cmpKindLightenAmount, "onedark_dark"), bg = "${cyan}" },
            },
        })
        vim.cmd("colorscheme onedark_dark")
    end,
}
-- Alternative themes
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
