require("items.widgets.battery")
require("items.widgets.volume")
require("items.widgets.wifi")
require("items.widgets.cpu")
local colors = require("colors")

-- bracket right items
sbar.add('bracket', 'items.right', {
        "calendar.bracket",
        "widgets.wifi.padding",
        "widgets.volume2",
        "widgets.battery",
        "widgets.cpu",
    },
    {
        background = {
            color = colors.bar.bg,
            border_width = 0,
            height = 40,
            corner_radius = 15
        }
    }
)


-- global bracket for widgets
sbar.add("bracket", "widget.bracket", {
    "widgets.wifi.padding",
    "widgets.volume2",
    "widgets.battery"
}, {
  background = { color = colors.bg1 },
  popup = { align = "center" },
})
