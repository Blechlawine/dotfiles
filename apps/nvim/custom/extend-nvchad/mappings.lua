---@type MappingsConfig
local M = {}

M.general = {
    n = {
        ["<C-Up>"] = { ":m.-2<cr>", "Move line up" },
        ["<C-Down>"] = { ":m.+1<cr>", "Move line down" },
        ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree", opts = {} },
    }
}

return M
