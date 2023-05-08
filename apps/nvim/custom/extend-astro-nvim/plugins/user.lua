return {
	-- You can also add new plugins here as well:
	-- Add plugins, the lazy syntax
	-- "andweeb/presence.nvim",
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
	-- For TSX syntax highlighting
	{
		"peitalin/vim-jsx-typescript",
		event = "BufRead .tsx",
		config = function()
			require("jsx-typescript").setup()
		end,
	},
	-- Codeium AI Autocomplete
	{
		"Exafunction/codeium.vim",
		lazy = false,
	},
	{
		"gelguy/wilder.nvim",
		lazy = false,
		config = function()
			-- config goes here
			local wilder = require("wilder")
			wilder.setup({
				modes = { ":", "/", "?" },
			})
			wilder.set_option("pipeline", {
				wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
			})
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
					-- 'single', 'double', 'rounded' or 'solid'
					-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
					border = "rounded",
					max_height = "75%", -- max height of the palette
					min_height = 0, -- set to the same as 'max_height' for a fixed height window
					prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
					reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
				}))
			)
		end,
	},
	{
		"rmagatti/session-lens",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({})
		end,
	},
}
