Blechvim = {
    which_key_queue = {},
}

require("core.config")
local mappings = require("core.mappings")
local utils = require("core.utils")

utils.load_mappings(mappings)

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
