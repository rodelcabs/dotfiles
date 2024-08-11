local constants = require("overseer.constants")
local Notifier = require("overseer.notifier")
local util = require("overseer.util")
local notify require('notify');
local STATUS = constants.STATUS

return {
  desc = "vim.notify when task is completed",
  params = {
    statuses = {
      desc = "List of statuses to notify on",
      type = "list",
      subtype = {
        type = "enum",
        choices = STATUS.values,
      },
      default = {
        STATUS.FAILURE,
        STATUS.SUCCESS,
      },
    },
    cb = {
        type = 'function',
        default = function ()
            vim.notify("Run Complete");
        end
    },
    system = {
      desc = "When to send a system notification",
      type = "enum",
      choices = { "always", "never", "unfocused" },
      default = "never",
    },
    on_change = {
      desc = "Only notify when task status changes from previous value",
      long_desc = "This is mostly used when a task is going to be restarted, and you want notifications only when it goes from SUCCESS to FAILURE, or vice-versa",
      type = "boolean",
      default = false,
    },
  },
  constructor = function(params)
    if type(params.statuses) == "string" then
      params.statuses = { params.statuses }
    end
    local lookup = util.list_to_map(params.statuses)

    return {
      last_status = nil,
      notifier = Notifier.new({ system = params.system }),
      on_complete = function(self, task, status)
        if lookup[status] then
          -- local level = util.status_to_log_level(status)
          -- local message = string.format("%s %s", status, task.name)
          -- self.notifier:notify(message, level)
          params.cb(status)
        end
      end,
    }
  end,
}
