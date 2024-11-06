--- @type LazySpec
return {
    "folke/which-key.nvim",
    lazy = false,
    init = function()
        vim.o.timeout = false
        vim.o.timeoutlen = 0
    end,
    opts = {},
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add(require("core.mappings"))
    end,
}
