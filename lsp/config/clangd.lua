return {
  capabilities = {
    offsetEncoding = "utf-8",
  },
  cmd = {
    "clangd",
    "--all-scopes-completion",
    "--suggest-missing-includes",
    "--background-index",
    "--pch-storage=disk",
    "--cross-file-rename",
    "--log=info",
    "--completion-style=detailed",
    "--clang-tidy",
    "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
    "--fallback-style=WebKit",
    "--header-insertion=never",
  },
}
