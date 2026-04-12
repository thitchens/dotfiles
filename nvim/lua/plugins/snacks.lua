local function notifications()
	Snacks.notifier.show_history()
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		notifier = { enabled = true },
	},
	keys = {
		{ "n", "<leader>n", notifications, desc = "Show Notifications" },
	},
}
