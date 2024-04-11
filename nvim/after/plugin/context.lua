require'treesitter-context'.setup{
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 5,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = '-',
    zindex = 20,
    on_attach = nil,
}

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })
