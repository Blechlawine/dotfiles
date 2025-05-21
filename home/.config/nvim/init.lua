require("core.config") -- Apply config
-- require("core.mappings") -- Load keymaps (this has been moved to plugins/which-key.lua)

-- add binaries installed by mason.nvim to path
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"

-- Install lazy.nvim (Code snippet from: https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation)
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    local utils = require("core.utils")
    -- install lazy.nvim
    utils.echo("  Installing lazy.nvim & plugins ...")
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path
    })

    utils.echo("Done installing lazy.nvim")
end

-- load lazy.nvim
vim.opt.rtp:prepend(lazy_path)

require("lazy").setup(require("plugins"), require("plugins.config.lazy"))
