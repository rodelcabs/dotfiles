local overseer = require('overseer')
local nvimNotify = require('notify');
local utils = require('core.utils');
local testEnvVars = utils.testCommandEnvironment;

overseer.setup({
    templates = {
        "builtin",
        "tasks.run_test"
    },
    task_list = {
        bindings = {
            ["?"] = "ShowHelp",
            ["<CR>"] = "RunAction",
            ["<C-e>"] = "Edit",
            ["o"] = "Open",
            ["<C-v>"] = "OpenVsplit",
            ["<C-s>"] = "OpenSplit",
            ["<C-f>"] = "OpenFloat",
            ["<C-q>"] = "OpenQuickFix",
            ["p"] = "TogglePreview",
            ["<C-l>"] = "IncreaseDetail",
            ["<C-h>"] = "DecreaseDetail",
            ["L"] = "IncreaseAllDetail",
            ["H"] = "DecreaseAllDetail",
            ["["] = "DecreaseWidth",
            ["]"] = "IncreaseWidth",
            ["{"] = "PrevTask",
            ["}"] = "NextTask",
        }
    }
});

local runNearestTest = function (showOutput, integration)
    local nearestTest = require('core.configs.dap.debug_test').getNearestTest();
    if nearestTest ~= 'no-test' then
        local title = "Run: " .. nearestTest;
        local env = {};

        nvimNotify(" Running..", "info", {title = title});
        if integration then
            env = testEnvVars;
            print('integration test enabled..')
        end

        overseer.run_template({ name = "run current test (mocha)", env = env }, function(task)
            if task and showOutput then
                local main_win = vim.api.nvim_get_current_win()
                overseer.run_action(task, "open hsplit")
                vim.api.nvim_set_current_win(main_win)
            end
        end)
    else
        nvimNotify(" No Test Found", vim.log.levels.WARN, {title = "Run Current Test"});
    end
end

--temporary 
vim.notify = nvimNotify;
vim.api.nvim_create_user_command("RunCurrentTest", function ()
    runNearestTest()
end, {});
vim.api.nvim_create_user_command("RunCurrentIntegrationTest", function ()
    runNearestTest(false, true);
end, {});

vim.api.nvim_create_user_command("RunCurrentTestWithOutput", function ()
    runNearestTest(true)
end, {});
vim.api.nvim_create_user_command("RunCurrentIntegrationTestWithOutput", function ()
    runNearestTest(true, true);
end, {});
-- functions for keymaps
-- vim.api.nvim_create_user_command("RunCurrentTest", function ()
--     local nearestTest = require('core.configs.dap.debug_test').getNearestTest();
--     if nearestTest ~= 'no-test' then
--         local title = "Run: " .. nearestTest;
--         nvimNotify(" Running..", "info", {title = title});
--         overseer.run_template({ name = "run current test (mocha)" }, function (task)
--             if task then
--                 task:add_component({
--                     {
--                         'comps.notifier',
--                         cb = function ()
--                             nvimNotify(" ✔ Passed", "info", {title = title});
--                         end
--                     },
--                 });
--                 task:start();
--             else
--                 nvimNotify( " Something wen wrong", "error", {
--                     title = title
--                 });
--             end
--         end)
--     else
--         nvimNotify(" No Test Found", vim.log.levels.WARN, {title = "Run Current Test"});
--     end
-- end, {});
