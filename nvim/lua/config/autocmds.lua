-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Autosave: write modified, named, normal buffers when leaving insert mode or focus
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost", "BufLeave" }, {
  group = vim.api.nvim_create_augroup("autosave", { clear = true }),
  nested = true, -- let BufWritePre (format on save) fire
  callback = function(ev)
    local bo = vim.bo[ev.buf]
    if bo.modified and bo.modifiable and bo.buftype == "" and vim.api.nvim_buf_get_name(ev.buf) ~= "" then
      vim.api.nvim_buf_call(ev.buf, function()
        vim.cmd("silent! update")
      end)
    end
  end,
})
