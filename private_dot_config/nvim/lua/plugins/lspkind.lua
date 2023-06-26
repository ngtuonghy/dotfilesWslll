local lunarIcons = require("icons.lunarIcons")
-- local lspIcons = require("icons.lspIcons")
return {
  --"onsails/lspkind-nvim", -- completion menu icons
  require("lspkind").init({
    symbol_map = lunarIcons,
  }),
}
