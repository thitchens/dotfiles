return {
	"tpope/vim-fugitive",
	dependencies = { "airblade/vim-gitgutter" },
	keys = {
		{ "<leader>gb", ":Git blame<CR>", desc = "Blame Line" },
		{ "<leader>gg", ":Git<CR>", desc = "Open git window" },
	},
}
