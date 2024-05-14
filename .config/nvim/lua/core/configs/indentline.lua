local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	return
end

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}

-- vim.g.indent_blankline_enabled = 0
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false
-- vim.g.indent_blankline_show_current_context = true
-- vim.g.indent_blankline_show_current_context_start = true
vim.g.indent_blankline_context_patterns = {
	"class",
	"return",
	"function",
	"method",
	"^if",
	"^while", "jsx_element",
	"^for",
	"^object",
	"^table",
	"block",
	"arguments",
	"if_statement",
	"else_clause",
	"jsx_element",
	"jsx_self_closing_element",
	"try_statement",
	"catch_clause",
	"import_statement",
	"operation_type",
}

indent_blankline.setup({
    indent = {
        -- char = "│"
        char = "▏",
    },
    scope = {
        show_start = false,
        show_end = false
    }
});
