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
		{ "<leader>kn", notifications, desc = "Show Notifications" },
	},
}
