local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

-- Padding item required because of bracket
sbar.add("item", "apple.padding.left", { width = 5 })

local apple = sbar.add("item", "item.apple", {
  icon = {
    font = { size = 16.0 },
    string = icons.apple,
    padding_right = 8,
    padding_left = 8,
  },
  label = { drawing = false },
  padding_left = 1,
  padding_right = 1,
  click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0"
})

-- Padding item required because of bracket
sbar.add("item", "apple.padding.right", { width = 7 })

sbar.add("bracket", "apple.bracket", {
    "apple.padding.left",
    "item.apple",
    "apple.padding.right"
}, {
    background = {
        color = colors.bar.bg,
        border_width = 0
    },
})
