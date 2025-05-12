vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Colorschemes for git conflicts
vim.api.nvim_command('highlight default ConflictIncoming guibg=#8A2A2A')
vim.api.nvim_command('highlight default ConflictHead guibg=#0B5A0E')

-- highlight NewColour guibg=#ƒƒƒƒƒƒ
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- Git conflict
    {'akinsho/git-conflict.nvim', version = "*", opts = {  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = 'ConflictIncoming',
    current = 'ConflictHead',
  }}},
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- C++ debugger
  {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'ldelossa/nvim-dap-projects',
    'nvim-neotest/nvim-nio'
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  --- Clangd-format
  'rhysd/vim-clang-format',

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "mason-org/mason.nvim", version = "^1.0.0" },
      { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {}, commit = "90c22e47be057562ee9566bad313ad42d622c1d3" },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Telescope undo tree
  {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    require("telescope").setup({
      -- the rest of your telescope config goes here
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
        },
        -- other extensions:
        -- file_browser = { ... }
      },
    })
    require("telescope").load_extension("undo")
    -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
  end,
},

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Nvim tree
  'nvim-tree/nvim-tree.lua',

  -- Oil
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  -- Rust tools
  'simrat39/rust-tools.nvim',

  -- Theme
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = "ibl",
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require("nvim-treesitter.install").prefer_git = true
      -- pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

}, {})

-- [[ Setting options ]]
-- See `:help vim.o`


-- Color trailing spaces/tabs
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    callback = function()
        vim.cmd(':highlight ExtraWhitespace ctermbg=red guibg=red')
        vim.cmd(':match ExtraWhitespace /\\s\\+$/')
    end
})

-- trigger `autoread` when files changes on disk
vim.g.autoread = true

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Break line at 80 characters
vim.o.cc = "80"

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Save undo history
vim.o.undofile = true

-- Show white characters
vim.o.list = true
vim.o.listchars="eol:↵,trail:~,tab:>-,nbsp:␣"

--- Set gui curosr
vim.o.guicursor="v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20,a:blinkon1"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--- Set relative number
vim.o.relativenumber = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect,noinsert'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Set tab as 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for conflict
vim.keymap.set('n', 'gb', '');
vim.keymap.set("n", "gc", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Configure rust-tools
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
local dap = require'dap'
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-dap',
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {}
  }
}
dap.configurations.c = dap.configurations.cpp

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- Toggle undo tree
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- Build and run simple C++ program
vim.g.splitbelow = 1
vim.keymap.set('n', '<Leader>bs', ':botright :split | resize 10 | terminal clang++ -g -O0 -std=c++20 % && ./a.out<cr>', { silent = true, desc = "C++20 simple build"})
vim.keymap.set('n', '<Leader>bc', ':botright :split | resize 10 | terminal mkdir -p build && cd build && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && make -j<cr>', { silent = true, desc = "CMake build" })
vim.keymap.set('n', '<Leader>rr',
  function()
  local fname = vim.fn.input('Path to executable: ', './' , 'file')
  vim.cmd('botright :split | resize 10 | terminal ' .. fname)
  end
  , { silent = true, desc = "Run program"})


-- Print unsaved changes
vim.keymap.set('n', '<Leader>m', ':vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis<cr>', { silent = true, desc = "Show unsaved changes" })

-- Print/Copy path of file
function CopyFilePath()
  local filepath = vim.fn.expand('%:p')
  print(filepath)
  vim.fn.setreg('+', filepath)
end
vim.keymap.set('n', '<Leader>ff', ":echo expand('%:p')<cr>", { desc = "Show file path"})
vim.keymap.set('n', '<Leader>fc', CopyFilePath, { desc = "Copy file path"})

require("dapui").setup()

vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end, { desc = "Continue" })
vim.keymap.set('n', '<Leader>do', function() require('dap').step_over() end, { desc = "Step over" })
vim.keymap.set('n', '<Leader>di', function() require('dap').step_into() end, { desc = "Step into" })
vim.keymap.set('n', '<Leader>de', function() require('dap').step_out() end, { desc = "Step out" })
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end, { desc = "Set breakpoint" })
vim.keymap.set('n', '<Leader>de', function() require('dapui').close() end, { desc = "Exit dapui" })

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'lua', 'python', 'rust', 'vimdoc', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Delete line
vim.keymap.set('n', '<C-y>', ":delete<CR>", {desc = "Delete current line"})

-- Duplicate line
vim.keymap.set('n', '<C-d>', ":t.<CR>", {desc = "Duplicate current line"})
vim.keymap.set('i', '<C-d>', "<ESC>:t.<CR>", {desc = "Duplicate current line"})

-- Move line up
vim.keymap.set('n', '<C-Up>', ":m-2<CR>", {desc = "Move line up"})
vim.keymap.set('i', '<C-Up>', "<ESC>:m-2<CR>", {desc = "Move line up"})

-- Move line down
vim.keymap.set('n', '<C-Down>', ":m+1<CR>", {desc = "Move line down"})
vim.keymap.set('i', '<C-Down>', "<ESC>:m+1<CR>", {desc = "Move line down"})

-- Default copy before cursor
vim.keymap.set('n', 'p', '"+P')

-- TODO: tab, and undo tab
--nmap <C-Tab> :<<CR>

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- LSP servers
local servers = {
  clangd = {},
  pyright = {},
  rust_analyzer = {},
  ansiblels = {},
  bashls = {},
  yamlls = {},
  cmake = {},
  docker_compose_language_service = {},
  dockerls = {},
  diagnosticls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- Setup Oil
require("oil").setup({
  delete_to_trash = true,
  watch_for_changes = true,
  keymaps = {
    ["<C-h>"] = { "actions.toggle_hidden", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<Esc>"] = { "actions.close", mode = "n" },
    ["<C-c>"] = {},
  },
})

-- Open oil with Ctrl-B
vim.keymap.set('n', '<C-b>', function() require("oil").toggle_float() end, {desc = "Open Oil"})

-- Setup nvim-tree
require("nvim-tree").setup({
  git = {ignore = false},
  actions = {
    open_file = {
      resize_window = false,
    },
  },
})

-- NvimTree config
vim.keymap.set('n', '<Leader>tt', ":NvimTreeToggle<CR>", {desc = "Open nvim tree"})
vim.keymap.set('n', '<Leader>tf', ':NvimTreeFindFile<cr>', { desc = "Find current file" })


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Setup php
require("lspconfig").phpactor.setup{}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Down>"] = function()
      require('cmp').abort()
      vim.cmd('stopinsert | +1')
      vim.api.nvim_feedkeys("i", "n", false)
    end,
    ["<Up>"] = function()
      require('cmp').abort()
      vim.cmd('stopinsert | -1')
      vim.api.nvim_feedkeys("i", "n", false)
    end,
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-Down>'] = cmp.mapping.select_next_item(),
    ['<C-Up>'] = cmp.mapping.select_prev_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require("ibl").setup()

require('lspconfig').clangd.setup {
--   cmd = { "docker", "exec",  "-i", "example_container", "clangd", "--compile-commands-dir=/home/wojtek/git_projects/Clangd-Docker-NeoVim/examples/exampleApp/build"}
  --  cmd = {"clangd", "-offset-encoding=utf-16"},
}

-- Default options for theme
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

-- Setup harpoon
local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end, { desc = "Add file to harpoon" } )
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon #1" } )
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon #2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon #3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon #4" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon #5" })
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "Harpoon #6" })
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = "Harpoon #7" })
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = "Harpoon #8" })
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, { desc = "Harpoon #9" })

-- Git conflict keymaps
vim.keymap.set("n", "<leader>gl", ':GitConflictListQf<cr>', { desc = "List git conflicts in repo" })
vim.keymap.set("n", "<leader>gn", ':GitConflictNextConflict<cr>', { desc = "Go to next conflict" })
vim.keymap.set("n", "<leader>gp", ':GitConflictPrevConflict<cr>', { desc = "Go to prev conflict" })
vim.keymap.set("n", "<leader>gb", ':GitConflictChooseBoth<cr>', { desc = "Chose both" })
vim.keymap.set("n", "<leader>go", ':GitConflictChooseOurs<cr>', { desc = "Chose ours" })
vim.keymap.set("n", "<leader>gt", ':GitConflictChooseTheirs<cr>', { desc = "Chose theirs" })


-- Unbind PgUp/PgDown
vim.keymap.set("", "<C-f>", "<Nop>")


------------------------
--- Macros ---
------------------------
vim.keymap.set("n", "<S-q>", "<Nop>")
vim.keymap.set("n", "@c", 'gg0^VG$y<C-o>zz', { desc = "Copy file content" })
vim.keymap.set("n", "@d", 'gg0^VG$dg//^\\s*$/d', { desc = "Delete file content" })
