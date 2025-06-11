local settings = require("settings")
local colors = require("colors")
local command =
	"aerospace list-monitors --focused --format %{monitor-id} && aerospace list-workspaces --monitor all --visible --format %{monitor-id}::%{workspace} | sort -t ':' -k1,1"

-- Function to parse the command output
local function parse_spaces(output)
	local spaces = {}
	local current_space = ""
	for i, line in ipairs(explode("\n", output)) do
		if i == 1 then
			current_space = line
			goto continue
		end
		table.insert(spaces, explode("::", line))
		::continue::
	end

	local labels = {}
	for _, space in ipairs(spaces) do
		if space[1] == current_space then
			table.insert(labels, "*" .. space[2])
		else
			table.insert(labels, space[2])
		end
	end
	return table.concat(labels, "|")
end

-- Add padding item
sbar.add("item", {
	position = "right",
	width = settings.group_paddings,
})

-- Add the space_screen item
local space_screen = sbar.add("item", {
	position = "right",
	icon = {
		drawing = false,
	},
	background = {
		color = colors.bg2,
		border_color = colors.rainbow[#colors.rainbow],
		border_width = 1,
	},
	label = {
		padding_left = 8,
		padding_right = 8,
		align = "center",
		font = {
			style = settings.font.style_map["Bold"],
			size = 13.0,
		},
	},
	padding_left = 1,
	padding_right = 1,
	updates = true,
})

-- Add another padding item
sbar.add("item", {
	position = "right",
	width = settings.group_paddings,
})

sbar.exec(command, function(result)
	local formatted_label = parse_spaces(result)
	space_screen:set({
		label = formatted_label,
	})
end)

-- Subscribe to the 'workspaces_screen' event
space_screen:subscribe("workspaces_screen", function(env)
	sbar.exec(command, function(result)
		local formatted_label = parse_spaces(result)
		space_screen:set({
			label = formatted_label,
		})
	end)
end)
