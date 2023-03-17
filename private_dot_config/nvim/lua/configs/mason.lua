-----------
-- Mason --
-----------
return { 'williamboman/mason.nvim',
  dependencies = 'williamboman/mason-lspconfig.nvim',
          config = function()
    require('mason').setup()
    require ('mason-null-ls').setup({
    ensure_installed = {'shfmt', 'autopep8', 'prettierd'}
})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',        -- Lua
        'rust_analyzer', -- Rust
        'tsserver',      -- TypeScript
        'vimls',         -- Vim
        'bashls',        -- Bash/Zsh
        'pylsp',         -- Python
        'lemminx',       -- XML
        'jsonls',        -- JSON
      },
    })
  end
}
