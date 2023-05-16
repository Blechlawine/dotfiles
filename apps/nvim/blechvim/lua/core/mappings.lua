local sections = {
    f = { desc = "󰍉 Find" },
    t = { desc = " Terminal" },
    g = { desc = "󰊢 Git" },
    l = { desc = " LSP" },
    s = { desc = "󱂬 Sessions" },
}

return {
    general = {
        i = {
            -- insert mode
            -- save
            ["<C-s>"] = { "<Esc>:w!<CR>", "save" },

            -- toggle comment
            ["<C-/>"] = {
                function()
                    require("Comment.api").toggle.linewise.current()
                end,
                "toggle comment",
            },

            -- moving lines up and down
            ["<C-Up>"] = { "<esc>:m.-2<cr>i", "Move line up" },
            ["<C-Down>"] = { "<esc>:m.+1<cr>i", "Move line down" },
            -- Open File-explorer
            ["<C-\\>"] = { "<esc>:Neotree toggle<cr>i", "Open Neotree" },
        },
        n = {
            ["<leader>f"] = sections.f,
            ["<leader>t"] = sections.t,
            ["<leader>g"] = sections.g,
            ["<leader>l"] = sections.l,
            ["<leader>s"] = sections.s,
            -- normal mode
            -- move between windows
            ["<C-h>"] = { "<C-w>h", "window left" },
            ["<C-j>"] = { "<C-w>j", "window down" },
            ["<C-k>"] = { "<C-w>k", "window up" },
            ["<C-l>"] = { "<C-w>l", "window right" },

            -- save
            ["<C-s>"] = { "<Esc>:w!<CR>", "save" },

            -- toggle comment
            ["<C-/>"] = {
                function()
                    require("Comment.api").toggle.linewise.current()
                end,
                "toggle comment",
            },

            -- moving lines up and down
            ["<C-Up>"] = { ":m.-2<cr>", "Move line up" },
            ["<C-Down>"] = { ":m.+1<cr>", "Move line down" },

            -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
            -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
            -- empty mode is same as using <cmd> :map
            -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
            ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
            ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
            ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
            ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },

            -- switching between open buffers
            L = {
                ":BufferLineCycleNext<CR>",
                "Next buffer",
            },
            H = {
                ":BufferLineCyclePrev<CR>",
                "Previous buffer",
            },
            ["<C-\\>"] = { ":Neotree toggle<cr>", "Open Neotree" },
        },
        t = {
            -- terminal mode
            ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "escape terminal mode" },
        },
        v = {
            -- visual mode
            ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
            ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
        }
    },

    telescope = {
        i = {
            ["<C-n>"] = {
                function()
                    require("telescope.actions").cycle_history_next()
                end
            },
            ["<C-p>"] = {
                function()
                    require("telescope.actions").cycle_history_prev()
                end
            },
            ["<C-j>"] = {
                function()
                    require("telescope.actions").move_selection_next()
                end
            },
            ["<C-k>"] = {
                function()
                    require("telescope.actions").move_selection_previous()
                end
            },
        },
        n = {
            ["q"] = {
                function()
                    require("telescope.actions").close()
                end,
                "Close"
            },
            ["<C-p>"] = {
                function()
                    require("telescope.builtin").git_files()
                end,
                "Find git files"
            },
            ["<C-t>"] = {
                function()
                    require("telescope.builtin").find_files()
                end,
                "Find files",
            },
            ["<leader>fg"] = {
                function()
                    require("telescope.builtin").live_grep()
                end,
                "Live grep",
            },
            ["<leader>fb"] = {
                function()
                    require("telescope.builtin").buffers()
                end,
                "Find buffers",
            },
            ["<leader>fh"] = {
                function()
                    require("telescope.builtin").help_tags()
                end,
                "Find help tags",
            },
        },
    },
}
