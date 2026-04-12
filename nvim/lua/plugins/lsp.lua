return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"rust_analyzer",
				"gopls",
				"lua_ls",
				"bashls",
				"html",
			},
			handlers = {
				["lua_ls"] = function()
					vim.lsp.config.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,

				["gopls"] = function()
					vim.lsp.config.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								buildFlags = { "-tags=unit all integration" },
							},
						},
					})
				end,
			},
		})

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, { desc = "go to definition" })
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, { desc = "definition hover" })
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, { desc = "workspace_symbol" })
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, { desc = "open_float" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, { desc = "goto_next" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, { desc = "goto_prev" })
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, { desc = "code_action" })
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, { desc = "references" })
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, { desc = "rename" })
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, { desc = "signature_help" })

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
