return {
    --- @type LazySpec
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false,
        opts = {
            provider = "jan",
            cursor_applying_provider = "jan",
            vendors = {
                ---@type AvanteProvider
                jan = {
                    __inherited_from = "openai",
                    endpoint = "http://localhost:42069/v1",
                    model = "deepseek-r1-distill-llama-8b",
                    api_key_name = "",
                    timeout = 30000, -- in ms
                    temperature = 0.5,
                    max_tokens = 4096,
                    disable_tools = true,
                }
            },
        },
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "hrsh7th/nvim-cmp",
        },
    },
}
