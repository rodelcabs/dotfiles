return {
    name = "run current test (mocha)",
    builder = function ()
        local nearestTest = require('core.configs.dap.debug_test').getNearestTest();

        if nearestTest == 'no-test' then
            return {
                cmd = {"echo"},
                args = {"NO TEST FOUND"}
            }
        end

        local cmd = {"mocha"};
        local args = {
            "-g",
            nearestTest
        }
        return {
            cmd = cmd,
            args = args,
        }
    end,
    desc = "Run nearest test",
};

