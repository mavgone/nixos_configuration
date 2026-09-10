-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.java",
  callback = function()
    if vim.fn.line("$") ~= 1 or vim.fn.getline(1) ~= "" then
      return
    end

    local classname = vim.fn.expand("%:t:r")
    local filepath = vim.fn.expand("%:p")

    local pkg = filepath:match("src[/\\]main[/\\]java[/\\](.+)[/\\][^/\\]+%.java$")

    local lines = {}

    if pkg then
      pkg = pkg:gsub("[/\\]", ".")
      table.insert(lines, "package " .. pkg .. ";")
      table.insert(lines, "")
    end

    table.insert(lines, "public class " .. classname .. " {")
    table.insert(lines, "    ")
    table.insert(lines, "}")

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.api.nvim_win_set_cursor(0, { #lines - 1, 4 })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  callback = function()
    if vim.fn.line("$") ~= 1 or vim.fn.getline(1) ~= "" then
      return
    end

    local lines = {
      "def main():",
      "    ",
      "",
      "",
      "if __name__ == '__main__':",
      "    main()",
    }

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.api.nvim_win_set_cursor(0, { 2, 4 })
  end,
})
