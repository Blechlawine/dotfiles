return {
    ---INSERT MODE-------------------------------------------------------------------------------------------------------------------
    {
        mode = "i",
        -- save
        { "<C-s>",    "<Esc>:w!<CR>",              { desc = "save" } },
        -- moving lines up and down
        { "<C-Up>",   "<esc>:m.-2<cr>i",           { desc = "Move line up" } },
        { "<C-Down>", "<esc>:m.+1<cr>i",           { desc = "Move line down" } },

        -- Open file-explorer
        { "<C-\\>",   "<esc>:Neotree toggle<cr>i", { desc = "Open Neotree" } },

        -- accept emmet completion
        {
            "<C-e>",
            function()
                require("cmp").mapping.confirm({ select = false })
            end,
            desc = "Expand Emmet completion"
        },
    },

    ---NORMAL MODE-------------------------------------------------------------------------------------------------------------------
    {
        mode = "n",

        { "<leader>g", desc = "󰊢 Git" },
        -- vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')

        -- Easy paste for system clipboard
        { "<leader>y", [["+y]], mode = { "n", "v" }, desc = "Yank to system clipboard" },
        { "<leader>Y", [["+Y]], desc = "Yank line to system clipboard" },
        -- replace selection with yank register, without copying replaced text
        { "<leader>p", [["_dP]], mode = "x", desc = "Paste without copying replaced text" },

        { "<leader>e", nil, desc = "Code snippets" },
        -- golang if err != nil etc.
        {
            "<leader>ee",
            "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
            desc = "Golang error handler",
        },

        -- chmod current file to executable
        { "<leader>x", "<cmd>!chmod +x %<CR>", silent = true, desc = "Make current file executable" },

        -- move between windows
        { "<C-h>", "<C-w>h", desc = "window left" },
        { "<C-j>", "<C-w>j", desc = "window down" },
        { "<C-k>", "<C-w>k", desc = "window up" },
        { "<C-l>", "<C-w>l", desc = "window right" },

        -- Save
        { "<C-s>", ":w!<CR>", desc = "Save" },

        -- Move lines up and down
        { "<C-Up>", ":m.-2<cr>", desc = "Move line up" },
        { "<C-Down>", ":m.+1<cr>", desc = "Move line down" },

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        { "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', desc = "move down", expr = true },
        { "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', desc = "move up", expr = true },
        { "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', desc = "move up", expr = true },
        { "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', desc = "move down", expr = true },

        -- Open file-explorer
        { "<C-\\>", ":Neotree toggle<cr>", desc = "Open Neotree" },

        -- tmux-sessionizer
        { "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", desc = "tmux-sessionizer" },

        ---BUFFER MANAGEMENT-------------------------------------------------------------------------------------------------------------
        -- close current buffer
        { "<leader>c", ":confirm bd<CR>", desc = "Close current buffer" },
        --vim.keymap.set("n", "<C-q>", "<C-w>q", { desc = "Close current window" })
        -- switching between open buffers
        -- Replaced with harpoon further down
        --vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
        --vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

        ---LSP---------------------------------------------------------------------------------------------------------------------------
        { "<leader>l", desc = " LSP" },

        -- LSP mappings are defined in plugins/lspconfig.lua
        ---TELESCOPE---------------------------------------------------------------------------------------------------------------------
        { "<leader>f", desc = "󰍉 Find" },

        -- Find git files
        { "<C-p>", function() require("telescope.builtin").find_files() end, desc = "Find files" },
        -- Find files
        { "<C-t>", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, desc = "Find project symbols" },
        -- Live grep
        { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
        -- Find buffers
        {
            "<leader>fb",
            function() require("telescope.builtin").buffers() end,
            desc = "Find buffers"
        },
        -- Find help tags
        {
            "<leader>fh",
            function() require("telescope.builtin").help_tags() end,
            desc = "Find help tags"
        },
        -- Find notifications
        {
            "<leader>fn",
            function() require("telescope").extensions.notify.notify() end,
            desc = "Find notifications"
        },
        -- Fuzzy find in open buffer
        {
            "<leader>/",
            function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                require("telescope.builtin").current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end,
            desc = "Fuzzy find in open buffer"
        },
        -- Resume last search
        {
            "<leader>fr",
            function() require("telescope.builtin").resume() end,
            desc = "Resume last telescope search"
        },

        ---HARPOON-----------------------------------------------------------------------------------------------------------------------
        { "<leader>h", desc = "Harpoon" },

        {
            "<leader>hh",
            function() require("harpoon.ui").toggle_quick_menu() end,
            desc = "Toggle harpoon quick menu"
        },
        {
            "<C-Space>",
            function() require("harpoon.mark").add_file() end,
            desc = "Add current file to harpoon"
        },
        {
            "H",
            function() require("harpoon.ui").nav_prev() end,
            desc = "Navigate to previous file in harpoon"
        },
        {
            "L",
            function() require("harpoon.ui").nav_next() end,
            desc = "Navigate to next file in harpoon"
        },
    },

    ---VISUAL MODE-------------------------------------------------------------------------------------------------------------------
    {
        mode = "v",
        { "<Up>",   'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', desc = "move up",   expr = true },
        { "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', desc = "move down", expr = true },
    },
}
