vim.cmd([[
  augroup omnisharp_commands 
    autocmd!
    autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <silent> <buffer> gD <Plug>(omnisharp_preview_definition)
    autocmd FileType cs nmap <silent> <buffer> gu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <silent> <buffer> gI <Plug>(omnisharp_preview_implementations)
    autocmd FileType cs nmap <silent> <buffer> ga <Plug>(omnisharp_code_actions)
    autocmd FileType cs nmap <silent> <buffer> g. <Plug>(omnisharp_code_action_repeat)

    autocmd FileType cs nmap <silent> <buffer> <Leader>ot <Plug>(omnisharp_type_lookup)
    autocmd FileType cs nmap <silent> <buffer> <Leader>od <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <silent> <buffer> <Leader>os <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ox <Plug>(omnisharp_fix_usings)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ol <Plug>(omnisharp_navigate_up)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ok <Plug>(omnisharp_navigate_down)

    autocmd FileType cs nmap <silent> <buffer> <Leader>of <Plug>(omnisharp_code_format)
    autocmd FileType cs nmap <silent> <buffer> <Leader>or <Plug>(omnisharp_rename)

    autocmd CursorHold *.cs OmniSharpTypeLookup

  augroup end
]])


-- autocmd FileType cs xmap <silent> <buffer> <Leader>o. <Plug>(omnisharp_code_action_repeat)
-- autocmd FileType cs xmap <silent> <buffer> <Leader>oa <Plug>(omnisharp_code_actions)
--  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
--  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
--   autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
--   autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
--   autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)

