local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd({ "VimEnter", "BufNew" }, {
  pattern = "*.go",
  command = "map <C-f> <cmd>GoImport<CR>",
  group = format_sync_grp,
})

vim.api.nvim_create_autocmd({ "VimEnter", "BufNew" }, {
  pattern = "*",
  command = "set list listchars=tab:»\\ ,trail:·,eol:↲",
})

local compile_cpp = vim.api.nvim_create_augroup("run_cpp", {})
vim.api.nvim_create_autocmd({ "VimEnter", "BufNew" }, {
  pattern = "*.cpp",
  command =
  "map <F9> :lua vim.lsp.buf.format()<CR>:w<CR>:T cd %:p:h && g++ %:p -std=c++17 -fsanitize=undefined -fsanitize=address && ./a.out < input.txt && exit<CR>i",
  group = compile_cpp,
})

return {
  colorscheme = "catppuccin",
}
