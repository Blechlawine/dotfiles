return {
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git"
        },
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit in floating window" }
        }
    },
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    {
        'lewis6991/gitsigns.nvim',
        event = "BufEnter",
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation (jumping between hunks)
                map("n", "]g", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]g", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, { desc = "Jump to next change" })

                map("n", "[g", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[g", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, { desc = "Jump to previous change" })

                -- Actions
                -- map("n", "<leader>gd", gitsigns.diffthis)
                -- map("n", "<leader>gD", function() gitsigns.diffthis("~") end)
                map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
            end
        },
    },
}
