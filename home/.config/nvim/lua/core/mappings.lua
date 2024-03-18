local sections = {
    f = { "󰍉 Find" },
    t = { " Terminal" },
    g = { "󰊢 Git" },
    l = { " LSP" },
    s = { "󱂬 Sessions" },
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

            ["<C-e>"] = {
                function()
                    require("cmp").mapping.confirm({ select = false })
                end,
                "Expand Emmet completion"
            }
        },
        n = {
            -- normal mode
            ["<leader>f"] = sections.f,
            ["<leader>t"] = sections.t,
            ["<leader>g"] = sections.g,
            ["<leader>l"] = sections.l,
            ["<leader>s"] = sections.s,
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
            ["<leader>c"] = {
                ":confirm bd<CR>",
                "Close current buffer",
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

            -- tmux-sessionizer
            ["<C-f>"] = {
                ":silent !tmux neww tmux-sessionizer<CR>",
            },
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

    -- TODO: validate if these keybindings here work, or if they have to be defined in the lsp attach function
    lsp = {
        n = {
            ["<leader>ld"] = {
                function()
                    vim.diagnostic.open_float()
                end,
                "Show diagnostic floating window",
            },
            ["<leader>la"] = {
                function()
                    vim.lsp.buf.code_action()
                end,
                "Show code actions",
            },
            ["<leader>lu"] = {
                function()
                    vim.lsp.buf.references()
                end,
                "Show references",
            },
            ["<leader>lr"] = {
                function()
                    vim.lsp.buf.rename()
                end,
                "Rename symbol",
            },
            ["gd"] = {
                function()
                    vim.lsp.buf.definition()
                end,
                "Go to definition",
            },
            ["<leader>lh"] = {
                function()
                    vim.lsp.buf.signature_help()
                end,
                "Show signature help",
            },
            ["]d"] = {
                function()
                    vim.diagnostic.goto_next()
                end,
                "Go to next diagnostic",
            },
            ["[d"] = {
                function()
                    vim.diagnostic.goto_prev()
                end,
                "Go to previous diagnostic",
            },
            ["<leader>lf"] = {
                function()
                    vim.lsp.buf.format({ async = true })
                end,
                "Format current buffer",
            },
            ["<leader>lD"] = {
                function()
                    require("trouble").toggle()
                end,
                "Toggle all diagnostics with trouble"
            }
        },
    },

    telescope = {
        n = {
            ["<C-p>"] = {
                function()
                    require("telescope.builtin").git_files()
                end,
                "Find git files"
            },
            ["<C-t>"] = {
                function()
                    require("telescope.builtin").find_files()
                    -- TODO: don't ignore hidden files
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
            ["<leader>fn"] = {
                function()
                    require("telescope").extensions.notify.notify()
                end,
                "Find notifications",
            },
        },
    },

    codeium = {
        i = {
            ["<A-[>"] = {
                function()
                    return vim.fn["codeium#CycleCompletions"](-1)
                end,
                "Cycle completions backward",
                opts = {
                    expr = true,
                }
            },
            ["<A-]>"] = {
                function()
                    return vim.fn["codeium#CycleCompletions"](1)
                end,
                "Cycle completions forward",
                opts = {
                    expr = true,
                },
            },
            ["<C-y>"] = {
                function()
                    return vim.fn["codeium#Accept"]()
                end,
                "Accept completion",
                opts = {
                    expr = true,
                },
            },
        },
    },
    harpoon = {
        n = {
            ["<leader>h"] = {
                name = "Harpoon",
            },
            ["<leader>hh"] = {
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                "Toggle harpoon quick menu",
            },
            ["<leader>ha"] = {
                function()
                    require("harpoon.mark").add_file()
                end,
                "Add current file to harpoon",
            },
            ["<leader>hu"] = {
                function()
                    require("harpoon.ui").nav_prev()
                end,
                "Navigate to previous file in harpoon",
            },
            ["<leader>hd"] = {
                function()
                    require("harpoon.ui").nav_next()
                end,
                "Navigate to next file in harpoon",
            },
        },
    },
}
