-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Ported from the old config (lua/joaopedro/remap.lua + after/plugin/telescope.lua).
-- LazyVim uses snacks.picker instead of telescope, so these call Snacks directly.
local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex, { desc = "Netrw (Ex)" })
map("n", "<leader>pf", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<C-p>", function() Snacks.picker.git_files() end, { desc = "Git Files" })
map("n", "<leader>ps", function()
  local search = vim.fn.input("Grep > ")
  if search ~= "" then
    Snacks.picker.grep({ search = search, live = false })
  end
end, { desc = "Grep String" })
