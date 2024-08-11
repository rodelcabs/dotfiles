local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "core.configs.lsp.mason"
require("core.configs.lsp.handlers").setup()
require "core.configs.lsp.null-ls"
