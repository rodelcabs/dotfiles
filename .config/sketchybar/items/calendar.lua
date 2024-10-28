local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", "calendar.padding.1", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", "calendar", {
  icon = {
    color = colors.white,
    padding_left = 8,
    font = {
      style = settings.font.style_map["Black"],
      size = 12.0,
    },
  },
  label = {
    color = colors.white,
    padding_right = 8,
    width = 49,
    align = "right",
  },
  position = "right",
  update_freq = 10,
  padding_left = 1,
  padding_right = 1,
})

-- Padding item required because of bracket
sbar.add("item", "calendar.padding.2", { position = "right", width = settings.paddings})

sbar.add("bracket", "calendar.bracket", {
    "calendar.padding.1",
    "calendar",
    "calendar.padding.2"
},{
    background = {
        color = colors.bar.bg,
        border_width = 0
    }
})

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
  cal:set({ icon = os.date("%a. %d %b."), label = os.date("%H:%M") })
end)
