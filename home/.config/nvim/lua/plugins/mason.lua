return {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog"
    },
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    opts = {
        PATH = "skip",

        ui = {
            icons = {
                package_installed = "✓",
                package_uninstalled = "✗",
                package_pending = "⟳",
            },

            keymaps = {
                toggle_server_expand = "<CR>",
                install_server = "i",
                update_server = "u",
                check_server_version = "c",
                update_all_servers = "U",
                check_outdated_servers = "C",
                uninstall_server = "x",
                cancel_installation = "<C-c>",
            },
        },

        max_concurrent_installers = 10,
    },
    config = function(_, opts)
        require("mason").setup(opts)
    end
}
