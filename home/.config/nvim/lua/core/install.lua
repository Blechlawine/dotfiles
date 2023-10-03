local utils = require("core.utils")

return {
    install_lazy = function(install_path)
        -- install lazy.nvim
        utils.echo("  Installing lazy.nvim & plugins ...")
        local lazy_repo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({
            "git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, install_path
        })
        vim.opt.rtp:prepend(install_path)

        utils.echo("Done installing lazy.nvim")
    end,
}
