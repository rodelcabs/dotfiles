local M = {};

M.toggle_sidebar = function ()
    local is_nvim_tree_open = require('nvim-tree.view').is_visible();

    if(is_nvim_tree_open) then
        -- close nvim tree
        require('nvim-tree.api').tree.toggle();
    end

    -- then open sidebar
    require('sidebar-nvim').toggle()
end

-- ENV FOR TESTING USING OVERSEER
M.testCommandEnvironment = {
    BG_RUN_INTEGRATION_TESTS=true
};

return M
