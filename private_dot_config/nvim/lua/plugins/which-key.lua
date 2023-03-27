return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      setup = {
        plugins = {
          marks = false, -- shows a list of your marks on ' and `
          registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 10, -- how many suggestions should be shown in the list?
          },
          -- the presets plugin, adds help for a bunch of default keybindings in Neovim
          -- No actual key bindings are created
          presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false, -- bindings for prefixed with g
          },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        -- operators = { gc = "Comments" },
        key_labels = {
          -- override the label used to display some keys. It doesn't effect WK in any other way.
          -- For example:
          -- ["<space>"] = "SPC",
          -- ["<CR>"] = "RET",
          -- ["<tab>"] = "TAB",
        },
        icons = {
          breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
          separator = "➜", -- symbol used between a key and it's label
          group = "+", -- symbol prepended to a group
        },
        popup_mappings = {
          scroll_down = "<c-d>", -- binding to scroll down inside the popup
          scroll_up = "<c-u>", -- binding to scroll up inside the popup
        },
        window = {
          border = "rounded", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 3, -- spacing between columns
          align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specify a list manually
        triggers_blacklist = {
          -- list of mode / prefixes that should never be hooked by WhichKey
          -- this is mostly relevant for key maps that start with a native binding
          -- most people should not need to change this
          i = { "j", "k" },
          v = { "j", "k" },
        },
      },
    })
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
      return
    end
    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
    local mappings = {
      ["e"] = { "<cmd>Neotree toggle<CR>", "explorer" },
      ["P"] = { "<cmd>BufferLinePick<CR>", "Tab Line Pick" },
      ["c"] = { "<cmd>BufferLinePickClose<CR>", "Tab Line Pick Close" },
      ["p"] = { "<cmd>WindowPick<CR>", "Window pick" },
      ["BD"] = { "<cmd>Bdelete<CR>", "Window delete all" },
      ["BW"] = { "<cmd>Bwipeout<CR>", "Window delete " },
      ["Bw"] = { "<cmd>bwipeout<CR>", "Window delete " },
      ["Bd"] = { "<cmd>bdelete<CR>", "Window delete " },
      a = {
        name = "AutoRunner",
        r = { "<cmd>AutoRunnerRun<cr>", "Run the command" },
        t = { "<cmd>AutoRunnerToggle<cr>", "Toggle output window" },
        e = { "<cmd>AutoRunnerEditFile<cr>", "Edit build file (if available in runtime directory)" },
        a = { "<cmd>AutoRunnerAddCommand<cr>", "Add/change command" },
        c = { "<cmd>AutoRunnerClearCommand<cr>", "Clear command" },
        C = { "<cmd>AutoRunnerClearAll<cr>", "Clear all (command and buffers)" },
        p = { "<cmd>AutoRunnerPrintCommand<cr>", "Print command" },
      },
      f = {
        name = "FIND",
        -- b = {
        -- 	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
        -- 	"buffers",
        --},
        b = { "<cmd>Telescope file_browser<CR>", "file" },
        c = { "<cmd>Telescope bibtex<CR>", "citations" },
        l = { "<cmd>Telescope live_grep theme=ivy<CR>", "project" },
        f = { "<cmd>Telescope find_files<CR>", "project" },
        g = { "<cmd>Telescope git_branches<CR>", "branches" },
        h = { "<cmd>Telescope help_tags<CR>", "help" },
        k = { "<cmd>Telescope keymaps<CR>", "keymaps" },
        m = { "<cmd>Telescope man_pages<CR>", "man pages" },
        r = { "<cmd>Telescope registers<CR>", "registers" },
        t = { "<cmd>Telescope colorscheme<CR>", "thetheme" },
        y = { "<cmd>YankyRingHistory<CR>", "yanks" },
        -- c = { "<cmd>Telescope commands<CR>", "commands" },
        -- r = { "<cmd>Telescope oldfiles<CR>", "recent" },
      },
      h = {
        name = "hop",
        l = { "<cmd>HopLine<CR>", "HopLine" },
      },
      l = {
        name = "LSP",
        i = { ":LspInfo<cr>", "Connected Language Servers" },
        k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
        w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
        W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
        l = {
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
          "List Workspace Folders",
        },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
        r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        R = { "<cmd>Lspsaga rename<cr>", "Rename" },
        a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
        e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
        n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
        N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
        f = { "<cmd>Lspsaga lsp_finder<cr>", "lsp finder" },
      },
      t = {
        name = "Tabline",
        p = { "<cmd>BufferLineTogglePin<cr>", "Tab line Pin" },
        c = {
          r = { "<cmd>BufferLineCloseRight<cr>", "Tab line close all right" },
          l = { "<cmd>BufferLineCloseLeft<cr>", "Tab line close all right" },
        },
      },
      w = {
        name = "window spirit",
        E = { "<cmd>FocusEnable<cr>", "spirit enable" },
        D = { "<cmd>FocusDisable<cr>", "spirit disable" },
        M = { "<cmd>FocusMaximise<cr>", "spirit Maximim" },
        Eq = { "<cmd>FocusEqualise<cr>", "window equalise" },
        l = { "<cmd>FocusSplitLeft<cr>", "spirit left" },
        r = { "<cmd>FocusSplitRight<cr>", "spirit right" },
        u = { "<cmd>FocusSplitUp<cr>", "spirit up" },
        d = { "<cmd>FocusSplitDown<cr>", "spirit Down" },
        ----------------------------------------------------
        s = { "<cmd>WindowSwap<cr>", "Swap windowns" },
        S = { "<cmd>WindowSwapStay<cr>", "Swap Stay windowns" },
        Z = { "<cmd>WindowZap<cr>", "Delete windowns" },
      },
    }
    which_key.setup()
    which_key.register(mappings, opts)
  end,
}
