
local opts = {
  on_attach = function(client, bufnr)
    -- Never request typescript-language-server for formatting

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- 绑定快捷键
    require('keybindings').mapLSP(buf_set_keymap)
    -- 保存时自动格式化
    --vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end,

}


return {
  on_setup = function()
    require("lspconfig")["clangd"].setup(opts)
  end,
}
