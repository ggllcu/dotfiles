vim.cmd.source("~/.vimrc")

require("lg.lazy")

vim.cmd [[
set winbar=%=%m\ %f
]]

vim.cmd [[
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
]]
