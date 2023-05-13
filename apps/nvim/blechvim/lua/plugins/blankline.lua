return {
    "lukas-reineke/indent-blankline.nvim",
    init = function()
        require("core.utils").lazy_load_plugin("indent-blankline.nvim")
    end,
    opts = {
        indentLine_enabled = 1,
        filetype_exclude = {
            "help",
            "terminal",
            "lazy",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "mason",
            "",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,
    },
    config = function(_, opts)
        require("indent_blankline").setup(opts)
    end,
}