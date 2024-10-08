local peek = require("peek")

peek.setup{app = "browser"}
vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
vim.api.nvim_create_user_command("PeekClose", peek.close, {})

local peek_is_open = false
vim.keymap.set("n", "<LEADER>tm", function()
  if peek_is_open then
    vim.cmd("PeekClose")
    peek_is_open = false
  else
    vim.cmd("PeekOpen")
    if vim.fn.fnamemodify(vim.fn.expand("%"), ":e") == "md" then peek_is_open = true end
  end
end)
