local colors = require("sbar_setup.colors")

local frontApp = sbar.add("item", {
    icon = {
        font = "sketchybar-app-font:Regular:16.0",
    },
    label = {
        font = {
            style = "Black",
            size = 12.0,
        }
    },
    display = "active",
    background = {
        color = colors.itemBGColor,
    }
})

frontApp:subscribe("front_app_switched", function(env)
    frontApp:set({
        icon = {
            string = icon_map(env.INFO),
        },
        label = {
            string = env.INFO,
        }
    })
end)
