local M = {}

local function configure()
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg=0, fg='#993939' })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg=0, fg='#61afef'})
    vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg=0, fg='#98c379' })

    vim.fn.sign_define('DapBreakpoint', { text='●', texthl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint' })
end

local function configure_exts()

  local dap, dapui = require "dap", require "dapui"
  dapui.setup {
    expand_lines = false,
    layouts = { {
        elements = { {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "scopes",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          } },
        position = "right",
        size = 60
      }, {
        elements = { {
            id = "repl",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
        position = "bottom",
        size = 17
      } },
  } -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

function M.setup()
  configure() -- Configuration
  configure_exts() -- Extensions
  -- support for vscode debug configs
  require('dap.ext.vscode').load_launchjs();
end


return M
