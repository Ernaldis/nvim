vim.cmd([[
  autocmd BufWritePre * lua vim.lsp.buf.format({ async = true })
  autocmd BufWritePost *.rs silent !command cargo clippy --fix --allow-dirty -- -W clippy::pedantic -W clippy::expect_used -W clippy::unwrap_used -W clippy::nursery
]])

vim.api.nvim_exec([[
  augroup common
    autocmd!
    autocmd FileType sh setlocal noexpandtab
  augroup end

  augroup Shebang
    autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\"|$
    autocmd BufNewFile *.sh 0put =\"#!/usr/bin/bash bash\<nl>\"|$
  augroup end
]], false)
