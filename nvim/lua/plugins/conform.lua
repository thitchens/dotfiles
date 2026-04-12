return {
	"stevearc/conform.nvim",
	opts = {},
	dependencies = {
		{ "darold/pgFormatter" },
		{ "JohnnyMorganz/StyLua" },
	},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				sql = { "pg_format", type_case = 2 },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				go = { "gofmt", "goimports" },
				rust = { "rustfmt", lsp_format = "fallback" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})

		conform.formatters.sql = {
			append_args = function()
				return { "--comma-break", "--no-space-function" }
			end,
		}
	end,
}
