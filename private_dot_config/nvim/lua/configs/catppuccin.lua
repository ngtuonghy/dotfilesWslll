
return { 'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
	vim.g.catppuccin_flavour = 'macchiato' -- latte, frappe, macchiato, mocha
	require('catppuccin').setup()
  end
}
