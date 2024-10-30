return {
	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle",
		event = { "BufLeave", "FocusLost" }, -- Changed to only trigger on focus changes
		opts = {
			enabled = true,
			trigger_events = {
				immediate_save = { "BufLeave", "FocusLost" }, -- These are the only events that will trigger saves
				defer_save = {}, -- Removed InsertLeave and TextChanged
				-- cancel_defered_save = {}, -- Removed InsertEnter since we're not using deferred saves
			},
			condition = nil,
			write_all_buffers = false,
			noautocmd = false,
			lockmarks = false,
			debounce_delay = 1000,
			debug = false,
		},
	},
}
