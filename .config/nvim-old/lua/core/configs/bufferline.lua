return {
  options = {
    mode = "buffers",
    close_command = ":Bdelete!",
    right_mouse_command = ":Bdelete!",
    offsets = {
      { filetype = "NvimTree", text = " ", highlight = "Directory", padding = 1, text_align = "left" },
      { filetype = "lspsagaoutline", text = "Code Outline", highlight = "Directory", padding = 1 },
    },
    indicator = {
        icon = '|'
    },
    always_show_bufferline = true,
    buffer_close_icon = "✕",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 20,
  },
  highlights = {
    buffer_selected = {
      bold = true,
      italic = false,
    },
    tab_selected = {
      bold = false,
      italic = false,
    },
    indicator_selected = {
        fg = '#f78166',
        -- bg = '#f78166',
    },
  },
}
