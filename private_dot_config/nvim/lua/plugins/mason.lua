return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "clangd",
      "pyright",
      "jdtls",
      "csharp-language-server",
      -- "flake8",
    },
  },
}
