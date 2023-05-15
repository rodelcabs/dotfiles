local overseer = require('overseer')
local nvimNotify = require('notify');

overseer.setup({
    templates = {
        "builtin",
        "tasks.run_test"
    }
});

--temporary 
vim.notify = nvimNotify;
vim.api.nvim_create_user_command("RunCurrentTest", function ()
    local nearestTest = require('core.configs.dap.debug_test').getNearestTest();
    if nearestTest ~= 'no-test' then
        local title = "Run: " .. nearestTest;
        nvimNotify(" Running..", "info", {title = title});
        overseer.run_template({ name = "run current test (mocha)" })
    else
        nvimNotify(" No Test Found", vim.log.levels.WARN, {title = "Run Current Test"});
    end
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
