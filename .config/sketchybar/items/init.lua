local colors = require('colors')

require("items.apple")
require("items.menus")
require("items.spaces")
require("items.front_app")
require("items.calendar")
require("items.widgets")
require("items.media")

-- bracket left items
sbar.add('bracket', 'items.left', {
        "apple.bracket",
        "space.bracket",
        "menu.bracket",
        "front_app"
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
