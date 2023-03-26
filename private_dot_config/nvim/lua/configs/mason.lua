-----------
-- Mason --
-----------
return {
  'williamboman/mason.nvim',
  dependencies = 'williamboman/mason-lspconfig.nvim',
  config = function()
    require('mason').setup()
    -- require('mason-null-ls').setup({
    --   ensure_installed = { 'shfmt', 'autopep8', 'prettierd' },
    -- })
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',                    -- Lua
        -- 'rust_analyzer', -- Rust
        'tsserver',                  -- TypeScript
        'vimls',                     -- Vim
        'bashls',                    -- Bash/Zsh
        'pylsp',                     -- Python
        'lemminx',                   -- XML
        'jsonls',                    -- JSON
        'clangd',                    --Cpp
      },
      automatic_installation = true, -- not the same as ensure_installed
    })
    require('mason-null-ls').setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua",   -- lua formatter
        "eslint_d", -- ts/js linter
        "shfmt",
        "autopep8",
      },
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = true,
    })
  end,
}
