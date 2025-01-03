local options = require("rose-pine.config").options
local variants = {
	main = {
		_nc = "#ff0000",
		base = "#1c1a16", -- background
		surface = "#211f1d", -- statusline
		overlay = "#48413a", -- current line
		muted = "#4b4b4b", -- invisible characters
		subtle = "#616060", -- comments
		text = "#b4a989", -- main text
		love = "#d23f22", -- diagnostic errors + console [CHANGE]
		gold = "#97c7d9", -- strings and more things I dont want [CHANGE]
		-- gold = "#f6c177", -- strings and more things I dont want [CHANGE]
		-- rose = "#ebbcba",
		rose = "#5dc598", -- function name, braces [CHANGE]
		-- pine = "#31748f",
		pine = "#857b5e", -- keywords
		-- foam = "#9ccfd8",
		foam = "#5dc598", -- classname, trycatch
		-- iris = "#c4a7e7",
		iris = "#eeb437", --args
		-- leaf = "#95b1ac",
		leaf = "#ff00ff", -- ni idea
		-- highlight_low = "#21202e",
		highlight_low = "#ff0000",
		highlight_med = "#ffff00", -- highlighted current line (visual mode)
		highlight_high = "#ffffff",
		none = "NONE",
	},
	moon = {
		_nc = "#1f1d30",
		base = "#232136",
		surface = "#2a273f",
		overlay = "#393552",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ea9a97",
		pine = "#3e8fb0",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		leaf = "#95b1ac",
		highlight_low = "#2a283e",
		highlight_med = "#44415a",
		highlight_high = "#56526e",
		none = "NONE",
	},
	dawn = {
		_nc = "#f8f0e7",
		base = "#faf4ed",
		surface = "#fffaf3",
		overlay = "#f2e9e1",
		muted = "#9893a5",
		subtle = "#797593",
		text = "#575279",
		love = "#b4637a",
		gold = "#ea9d34",
		rose = "#d7827e",
		pine = "#286983",
		foam = "#56949f",
		iris = "#907aa9",
		leaf = "#6d8f89",
		highlight_low = "#f4ede8",
		highlight_med = "#dfdad9",
		highlight_high = "#cecacd",
		none = "NONE",
	},
}

if options.palette ~= nil and next(options.palette) then
	-- handle variant specific overrides
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "light" and variants.dawn or variants[options.dark_variant or "main"]
