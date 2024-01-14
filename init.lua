local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})

-- normal mode
vim.api.nvim_create_autocmd({ "VimEnter", "BufNew" }, {
  pattern = "*.go",
  command = "nmap <C-f> :GoImport<CR>",
  group = format_sync_grp,
})
-- insert mode
vim.api.nvim_create_autocmd({ "VimEnter", "BufNew" }, {
  pattern = "*.go",
  command = "imap <C-f> <Esc>:GoImport<CR>a",
  group = format_sync_grp,
})

-- show tabs, trailing spaces and \n
vim.api.nvim_create_autocmd({ "VimEnter", "BufNew" }, {
  pattern = "*",
  command = "set list listchars=tab:»\\ ,trail:·,eol:↲",
})

-- for competitive programming
local run_cpp = vim.api.nvim_create_augroup("run_cpp", {})
vim.api.nvim_create_autocmd({ "VimEnter", "BufNew" }, {
  pattern = "*.cpp",
  command =
  "map <F9> :lua vim.lsp.buf.format()<CR>:w<CR>:T cd %:p:h && g++ %:p -std=c++17 -fsanitize=undefined -fsanitize=address && ./a.out < input.txt && exit<CR>i",
  group = run_cpp,
})

return {
  colorscheme = "catppuccin",
}
