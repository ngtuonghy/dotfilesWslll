-----------
-- Alpha --
-----------
return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')
    local lazy_plugins = require('lazy').plugins()
    local section = dashboard.section
    local fn = vim.fn

    -- Header
    section.header.opts.hl = 'AlphaHeader'
    section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("fo", "  Recently used files", ":Telescope oldfiles<CR>"),
      dashboard.button("ff", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("fl", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h  | wincmd k | pwd<CR>"),
      dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
    }

    -- Footer
    local Footer = { items = {} }

    function Footer:add(icon, item, condition)
      if condition == nil or condition then
        table.insert(self.items, string.format('%s %s', icon, tostring(item)))
      end
    end

    function Footer:create()
      return table.concat(self.items, '  |  ')
    end

    local loaded_plugins_count = #vim.tbl_filter(function(plugin)
      return plugin._.loaded -- TODO: adapt this to Lazy
    end, lazy_plugins)

    local total_plugins_count = #vim.tbl_keys(lazy_plugins)
    local loaded_plugins = string.format(
      '%d/%d plugins',
      loaded_plugins_count,
      total_plugins_count
    )

    local version = vim.version() or {}
    local date = os.date('%d-%m-%Y')
    local version_string = string.format(
      'v%s.%d.%d',
      version.major,
      version.minor,
      version.patch
    )

    Footer:add('', loaded_plugins)
    Footer:add('', version_string)
    Footer:add('', date)

    section.footer.val = Footer:create()
    section.footer.opts.hl = 'NonText'

    -- Layout
    local topMarginRatio = 0.2
    local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * topMarginRatio) })

    dashboard.config.layout = {
      { type = 'padding', val = headerPadding },
      section.header,
      { type = 'padding', val = 2 },
      section.buttons,
      { type = 'padding', val = 2 },
      section.footer,
    }

    alpha.setup(dashboard.opts)
  end,
}
