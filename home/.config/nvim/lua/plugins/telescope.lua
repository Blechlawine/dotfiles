--- @type LazySpec
return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = 'master',
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            enabled = vim.fn.executable("make") == 1,
            build = "make"
        },
        -- use telescope for some native nvim windows like code-actions
        -- { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    opts = {
        pickers = {
            find_files = {
                hidden = true,
            },
            live_grep = {
                hidden = true,
            },
        },
        defaults = {
            file_ignore_patterns = {
                ".git/",
                "/node_modules",
                "bun.lock",
                "cargo.lock",
                "/target",
                ".cargo/registry",
                "CHANGELOG.md",
            },
            prompt_prefix = "   ",
            selection_caret = " ",
            entry_prefix = " ",
            path_display = { "truncate" },
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                },
                width = 0.87,
                height = 0.80,
            },
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--hidden',
            },
        },
        extensions = {
            ["ui-select"] = {
                -- What was this again? I think it works commented out as well
                -- require("telescope.themes").get_dropdown(),
            },
        }
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        -- Enable telescope extensions if theyre installed (pcall kinda catches errors)
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
        pcall(require("telescope").load_extension, "harpoon")
    end,
}
