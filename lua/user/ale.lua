vim.cmd([[
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_sign_column_always = 1

  let g:ale_sign_error = 'E'
  let g:ale_sign_warning = 'W'

  let g:ale_linters = {
      \ 'ruby': ['rubocop', 'sorbet'],
      \ 'typescript': ['eslint', 'tsserver'],
      \ 'javascript': ['eslint', 'flow'],
      \}

  let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \}

  let g:ale_ruby_rubocop_executable = './bin/container-rubocop'
  let g:ale_ruby_sorbet_executable = './bin/container-sorbet'
  let g:ale_javascript_eslint_executable = './bin/container-javascript'

  " nnoremap <silent><leader>lf :ALEFix<CR>
  " nnoremap <silent><leader>ld :ALEDetail<CR>
]])
