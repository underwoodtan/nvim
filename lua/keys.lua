local function diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
local lspmap = function(_, bufnr)
local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
end
  -- Enable completion triggered by <c-x><c-o>
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map('n', "gd", "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" )
  map('n', "gr", "<cmd>Telescope lsp_references<cr>", "References" )
  map('n', "gD", vim.lsp.buf.declaration, "Goto Declaration" )
  map('n', "gI", "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" )
  map('n', "gt", "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" )
  map('n', 'H', vim.lsp.buf.hover, "Hover")
  map({ 'n', 'i' }, '<C-h>', vim.lsp.buf.signature_help, "signature_help")
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, "add_workspace_folder")
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, "remove_workspace_folder")
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "list_workspace_folders")
  map('n', '<leader>rn', vim.lsp.buf.rename, "rename")
  map('n', '<leader>ca', vim.lsp.buf.code_action, "code_action")
  map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, "format")
  map('n', "]d", diagnostic_goto(true), "Next Diagnostic" )
  map('n', "[d", diagnostic_goto(false), "Prev Diagnostic" )
  map('n', "]e", diagnostic_goto(true, "ERROR"), "Next Error" )
  map('n', "[e", diagnostic_goto(false, "ERROR"), "Prev Error" )
  map('n', "]w", diagnostic_goto(true, "WARN"), "Next Warning" )
  map('n', "[w", diagnostic_goto(false, "WARN"), "Prev Warning" )
end


return (lspmap)
