---INSERT MODE-------------------------------------------------------------------------------------------------------------------
-- save
vim.keymap.set("i", "<C-s>", "<Esc>:w!<CR>", { desc = "save" })
-- moving lines up and down
vim.keymap.set("i", "<C-Up>", "<esc>:m.-2<cr>i", { desc = "Move line up" })
vim.keymap.set("i", "<C-Down>", "<esc>:m.+1<cr>i", { desc = "Move line down" })

-- Open file-explorer
vim.keymap.set("i", "<C-\\>", "<esc>:Neotree toggle<cr>i", { desc = "Open Neotree" })

-- accept emmet completion
vim.keymap.set("i", "<C-e>", function()
    require("cmp").mapping.confirm({ select = false })
end, { desc = "Expand Emmet completion" })

---NORMAL MODE-------------------------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>t", " Terminal")
vim.keymap.set("n", "<leader>g", "󰊢 Git")
vim.keymap.set("n", "<leader>s", "󱂬 Sessions")

-- Easy paste for system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- replace selection with yank register, without copying replaced text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- golang if err != nil etc.
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "window right" })

-- Save
vim.keymap.set("n", "<C-s>", ":w!<CR>", { desc = "Save" })

-- Move lines up and down
vim.keymap.set("n", "<C-Up>", ":m.-2<cr>", { desc = "Move line up" })
vim.keymap.set("n", "<C-Down>", ":m.+1<cr>", { desc = "Move line down" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
vim.keymap.set("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "move down", expr = true })
vim.keymap.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "move up", expr = true })
vim.keymap.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "move up", expr = true })
vim.keymap.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "move down", expr = true })

-- Open file-explorer
vim.keymap.set("n", "<C-\\>", ":Neotree toggle<cr>", { desc = "Open Neotree" })

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux-sessionizer" })

---BUFFER MANAGEMENT-------------------------------------------------------------------------------------------------------------
-- close current buffer
vim.keymap.set("n", "<leader>c", ":confirm bd<CR>", { desc = "Close current buffer" })
--vim.keymap.set("n", "<C-q>", "<C-w>q", { desc = "Close current window" })
-- switching between open buffers
-- Replaced with harpoon further down
--vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
--vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

---LSP---------------------------------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>l", " LSP")

-- LSP mappings are defined in plugins/lspconfig.lua
---TELESCOPE---------------------------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>f", "󰍉 Find")

-- Find git files
vim.keymap.set("n", "<C-p>", function() require("telescope.builtin").git_files() end, { desc = "Find git files" })
-- Find files
vim.keymap.set("n", "<C-t>", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
-- Live grep
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Live grep" })
-- Find buffers
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffers" })
-- Find help tags
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Find help tags" })
-- Find notifications
vim.keymap.set("n", "<leader>fn", function() require("telescope").extensions.notify.notify() end,
    { desc = "Find notifications" })
-- Fuzzy find in open buffer
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = "Fuzzy find in open buffer" })
-- Resume last search
vim.keymap.set("n", "<leader>fr", function() require("telescope.builtin").resume() end,
    { desc = "Resume last telescope search" })

---CODEIUM-----------------------------------------------------------------------------------------------------------------------
-- vim.keymap.set("i", "<A-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end,
--     { desc = "Cycle completions backward", expr = true })
-- vim.keymap.set("i", "<A-]>", function() return vim.fn["codeium#CycleCompletions"](1) end,
--     { desc = "Cycle completions forward", expr = true })
-- vim.keymap.set("i", "<C-y>", function() return vim.fn["codeium#Accept"]() end,
--     { desc = "Accept completion", expr = true })

---HARPOON-----------------------------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>h", "Harpoon")

vim.keymap.set("n", "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end,
    { desc = "Toggle harpoon quick menu" })
vim.keymap.set("n", "<C-Space>", function() require("harpoon.mark").add_file() end,
    { desc = "Add current file to harpoon" })
vim.keymap.set("n", "H", function() require("harpoon.ui").nav_prev() end,
    { desc = "Navigate to previous file in harpoon" })
vim.keymap.set("n", "L", function() require("harpoon.ui").nav_next() end,
    { desc = "Navigate to next file in harpoon" })

---VISUAL MODE-------------------------------------------------------------------------------------------------------------------
vim.keymap.set("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "move up", expr = true })
vim.keymap.set("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "move down", expr = true })
