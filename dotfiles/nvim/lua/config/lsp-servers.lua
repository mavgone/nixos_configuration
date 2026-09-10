local servers = {
  html = {
    cmd = { "vscode-html-language-server", "--stdio" },
  },
  yaml = {
    cmd = { "yaml-language-server", "--stdio" },
  },
  sh = {
    cmd = { "bash-language-server", "start" },
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(servers),
  callback = function(args)
    local server = servers[args.match]
    if server then
      vim.lsp.start({
        name = args.match,
        cmd = server.cmd,
        root_dir = vim.fs.root(0, { ".git" }) or vim.fn.getcwd(),
      })
    end
  end,
})
