local function configure()
	local wilder = require('wilder')
	wilder.setup({ modes = { ':', '/', '?', '.' } })

	wilder.set_option('renderer', wilder.popupmenu_renderer({
		-- highlighter applies highlighting to the candidates
		highlighter = wilder.basic_highlighter(),
	}))
end

local spec = {
	'gelguy/wilder.nvim',
	config = configure,
}

return spec
