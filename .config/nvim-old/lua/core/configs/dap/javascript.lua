local M = {};
M.setup = function ()
    local dap = require('dap');
    require('dap-vscode-js').setup({
        debugger_path = os.getenv('HOME') .. '/.config/dap/vscode-js-debug/',
        adapters = {
            'pwa-node',
            'pwa-chrome',
            'pwa-msedge',
            'node-terminal',
            'pwa-extensionHost',
        }
    });

    dap.adapters.node2 = {
      type = 'executable',
      command = 'node',
      args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
    }

    for _, language in ipairs({'typescript', 'javascript'}) do
        dap.configurations[language] = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file (TS)",
                runtimeArgs = { "-r", "ts-node/register" },
                runtimeExecutable = "node",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
            {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require'dap.utils'.pick_process,
                cwd = "${workspaceFolder}",
            },
            {
                type = "node2",
                request = "attach",
                name = "Attach2 - port 3000",
                port = 3000,
                processId = require'dap.utils'.pick_process,
                cwd = "${workspaceFolder}",
            },
            {
                type = "pwa-node",
                request = "launch",
                name = "Debug Test File",
                -- trace = true, -- include debugger info
                runtimeExecutable = "mocha",
                runtimeArgs = {
                  "${file}",
            },
                rootPath = "${workspaceFolder}",
                cwd = "${workspaceFolder}",
                console = "integratedTerminal",
                internalConsoleOptions = "neverOpen",
            },
        }
    end
end
return M;
