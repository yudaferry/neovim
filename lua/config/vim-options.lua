vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu")
vim.cmd("set rnu")
--vim.cmd("set foldmethod=syntax")
--vim.cmd("set foldlevel=99") -- Open all folds by default
--vim.cmd("set foldenable=true")
vim.cmd("filetype indent on")
vim.cmd("syntax on")

vim.g.mapleader = " "
vim.keymap.set('n', 'f', 'za', {noremap=true, silent=true})

local os_name = vim.loop.os_uname().sysname
if os_name == "Windows_NT" then
  -- Use PowerShell on Windows
  vim.cmd("set shell=powershell.exe")
  vim.cmd("set shellquote=\"")
  vim.cmd("set shellxquote=")
else
  -- Use a standard terminal (like Bash) on Linux/macOS
  vim.cmd("set shell=/bin/bash") -- or /bin/zsh, /usr/bin/fish, etc., depending on preference
end

