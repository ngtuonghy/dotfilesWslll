local setup, ray_beautiful = pcall(require, "ray_beautiful")
if not setup then
  return
end
vim.cmd [[
   let g:ray_base_url = 'http://localhost:3000'
]]
