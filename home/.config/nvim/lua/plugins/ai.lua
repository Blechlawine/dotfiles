return {
    {
        "Exafunction/codeium.nvim",
        event = { "BufRead" },
        dependencis = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function(_, _)
            -- Disable default keybindings of codeium
            vim.g.codeium_disable_bindings = 1
            require("codeium").setup({})
        end
    },
    {
        "olimorris/codecompanion.nvim",
        event = { "BufRead" },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
            { "nvim-lua/plenary.nvim" },
            -- Test with nvim-cmp
            -- { "hrsh7th/nvim-cmp" },
        },
        opts = {
            --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
            strategies = {
                --NOTE: Change the adapter as required
                chat = {
                    adapter = "ollama",
                    slash_commands = {
                        ["buffer"] = {
                            opts = {
                                provider = "telescope",
                                contains_code = true,
                            },
                        },
                    },
                },
                inline = { adapter = "ollama" },
                cmd = { adapter = "ollama" },
            },
            log_level = "DEBUG"
        },
    },
}
