print("jdtls ftplugin loaded")
local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. project_name

jdtls.start_or_attach({
  cmd = { "jdtls", "-data", workspace_dir },
  root_dir = vim.fs.root(0, {
    "pom.xml",
    "build.gradle",
    "build.gradle.kts",
    ".git",
  }),
})
