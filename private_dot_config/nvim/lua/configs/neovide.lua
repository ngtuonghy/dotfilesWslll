local g = vim.g

if vim.fn.exists('g:neovide') == 1 then
  g.neovide_floating_blur_amount_x = 3.0
  g.neovide_floating_blur_amount_y = 3.0
end
