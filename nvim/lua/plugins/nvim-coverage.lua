return {
	"andythigpen/nvim-coverage",
	version = "*",
	config = function()
		require("coverage").setup({
			auto_reload = true,
			summary = {
				min_coverage = 80.0,
			},
			lang = {
				go = {
					coverage_file = "coverage.out",
				},
			},
		})
	end,
	keys = {
		{ "<leader>cc", "<cmd>Coverage<cr>", desc = ":Coverage" },
		{ "<leader>cC", "<cmd>CoverageClear<cr>", desc = ":CoverageClear" },
		{ "<leader>cs", "<cmd>CoverageSummary<cr>", desc = ":CoverageSummary" },
		{ "<leader>cS", "<cmd>CoverageShow<cr>", desc = ":CoverageShow" },
		{ "<leader>ch", "<cmd>CoverageHide<cr>", desc = ":CoverageHide" },
	},
}
