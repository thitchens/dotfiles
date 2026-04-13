return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"echasnovski/mini.nvim",
		version = false,
	},
	opts = {
		plugins = { spelling = true },
		defaults = {
			{ "<leader><tab>", group = "tabs", desc = "tabs" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "code" },
			{ "<leader>f", group = "file/find" },
			{ "<leader>g", group = "git" },
			{ "<leader>gh", group = "hunks" },
			{ "<leader>k", group = "snacks" },
			{ "<leader>o", group = "go" },
			{ "<leader>q", group = "quit/session" },
			{ "<leader>r", group = "rename" },
			{ "<leader>s", group = "search" },
			{ "<leader>t", group = "test" },
			{ "<leader>u", group = "ui" },
			{ "<leader>w", group = "windows" },
			{ "<leader>x", group = "diagnostics/quickfix" },
			{ "[", group = "prev" },
			{ "]", group = "next" },
			{ "g", group = "goto" },
			{ "gz", group = "surround" },
		},
		notify = false,
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add(opts.defaults)
	end,
}
