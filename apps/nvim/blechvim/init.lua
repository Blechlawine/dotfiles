require("core")

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Install lazy.nvim
if not vim.loop.fs_stat(lazy_path) then
    require("core.install").install_lazy(lazy_path)
end

-- load lazy.nvim
vim.opt.rtp:prepend(lazy_path)

require("plugins")
