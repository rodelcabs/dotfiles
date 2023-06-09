local appendEscapeChar = function (testTitle)
    testTitle = testTitle:gsub("%(", "\\(");
    testTitle = testTitle:gsub("%)", "\\)");
    testTitle = testTitle:gsub("%/", "\\/");

    return testTitle;
end



local M = {};
M.getNearestTest = function ()
    local currentLine = vim.api.nvim_get_current_line();
    local is_test = string.find(currentLine, 'it%(') or string.find(currentLine, 'it %(')
    if is_test then
        local start = string.find(currentLine, 'it%(') and 'it%(' or 'it %(';
        local title = string.gsub(currentLine, start, "");
        local _, endS = string.find(title, ",");

        local s = string.find(title, "'") or  string.find(title, '"');
        if s ~= 1 then
            title = string.sub(title, s, endS-1);
        else
            title = string.sub(title, 0, endS-1);
        end

        return appendEscapeChar(title);
    end

    -- print('No test found!');
    -- if dap.session() then
    --     dap.disconnect();
    -- end
    return 'no-test'
end

M.debugNearTest = function (integration)
   local test = M.getNearestTest();

   if test ~= 'no-test' then
        local opts = {
            type = "pwa-node",
            request = "launch",
            name = "Debug Current Test",
            runtimeExecutable = "mocha",
            runtimeArgs = {
              '-g',
              test
            },
            env = {
                BG_INTEGRATION_TESTS = nil
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        };

        if integration then
            opts.env.BG_INTEGRATION_TESTS = true
        end

        require('dap').run(opts);
        return;
   end

   print('No Test Found');
end

return M;
