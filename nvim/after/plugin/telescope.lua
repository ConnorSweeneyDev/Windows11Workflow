require("telescope").setup
{
  defaults =
  {
    layout_config = {horizontal = {preview_width = 0.5}},

    -- Ignore any string that has the following patterns
    file_ignore_patterns = {".git\\", ".cache\\", "external\\", "ext\\", "binary\\", "bin\\", "assets\\", ".exe", ".dll", ".0", ".1", ".2", ".3",
                            ".4", ".5", ".6", ".7", ".8", ".9", ".class", ".jar", ".sln", ".vcxproj", ".png", ".jpg", ".pyc", "packer_compiled.lua"}
  },
  extensions = {["ui-select"] = {require("telescope.themes").get_dropdown{}}}
}

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<LEADER>pf", function() builtin.find_files({find_command = {"rg", "--files", "--hidden"}}) end, default_opts)
vim.keymap.set("n", "<LEADER>ps", function() builtin.grep_string({find_command = {"rg", "--files", "--hidden"}, search = vim.fn.input("Search Term: "), ignorecase = false}); end)
vim.keymap.set("n", "<LEADER>pw", function() builtin.grep_string({find_command = {"rg", "--files", "--hidden"}, search = vim.fn.expand("<cword>"), ignorecase = false}); end)
vim.keymap.set("n", "<LEADER>pW", function() builtin.grep_string({find_command = {"rg", "--files", "--hidden"}, search = vim.fn.expand("<cWORD>"), ignorecase = false}); end)
vim.keymap.set("n", "<LEADER>pb", builtin.buffers)
vim.keymap.set("n", "<C-p>", builtin.git_files)
