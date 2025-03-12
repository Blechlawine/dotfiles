--- @type LazySpec[]
return {
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git"
        },
    },
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    {
        'lewis6991/gitsigns.nvim',
        event = "BufEnter",
        opts = {},
    },
}
