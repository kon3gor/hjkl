local function user_command(name, cmd, opts)
	vim.api.nvim_create_user_command(name, cmd, opts)
end

--- Android stuff
user_command("InstallDebugApk", '!./gradlew installDebug', {})
user_command("InstallReleaseApk", '!./gradlew installRelease', {})

local function startEmulator(opts)
	local name = opts.fargs[1]
	local cmd = string.format("emulator @%s &", name)
	local result = vim.fn.jobstart(cmd)
	vim.cmd.echo(result)
end

local function availableEmulators()
	local path = "/tmp/emulators.txt"
	vim.cmd("!emulator -list-avds > " .. path)
	local lines = {}
	for line in io.lines(path) do
		lines[#lines + 1] = line
	end
	return lines
end

user_command("StartEmulator", startEmulator, {
	nargs = 1,
	complete = function(_, _, _)
		return availableEmulators()
	end,
})
--- user_command("Logcat", '!adb logcat', {})

-- Harpoon mappings
local harpoon_ui = require("harpoon.ui")

user_command('HarpoonQuickMenu', function()
	harpoon_ui.toggle_quick_menu()
end, {})

user_command('HarpoonNext', function()
	harpoon_ui.nav_next()
end, {})

user_command('HarpoonPrev', function()
	harpoon_ui.nav_prev()
end, {})
