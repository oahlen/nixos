-- Options
vim.cmd.colorscheme("iceberg")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.autoindent = true
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.guifont = "JetBrains Mono Nerd Font:h11"
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 2
vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.shiftwidth = 4
vim.o.showmatch = true
vim.o.showmode = true
vim.o.shortmess = "IF"
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true

vim.opt.list = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Disable some builtin vim plugins
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logipat = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

-- Commands
-- Fix cursor in terminal on exiting
vim.cmd [[
  augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver24
  augroup END
]]

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

-- Keymaps
-- Yank to end of line
vim.keymap.set("n", "Y", "y$")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Keep cursor in the middle of screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Faster way to enter insert mode
vim.keymap.set("v", "i", "<ESC>i")
vim.keymap.set("v", "a", "<ESC>a")

-- Sane way of exiting terminal mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- Close current buffer
vim.keymap.set("n", "<leader>q", "<CMD>bp<BAR>bd#<CR>", { desc = "Close current buffer" })

-- Tab operations
vim.keymap.set("n", "<leader>ta", "<CMD>$tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "Close current tab" })

-- Clear highlights
vim.keymap.set("n", "<leader>ch", "<CMD>nohl<CR>", { desc = "Clear search highlights" })

-- Plugins

require("Comment").setup()

require("conform").setup({
    formatters_by_ft = {
        fish = { "fish_indent" },
        json = { "jq" },
        nix = { "alejandra" }
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

require("gitsigns").setup {
    signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<space>hb", function() gs.blame_line { full = true } end,
            { desc = "[H]istory [B]lame", buffer = bufnr })
        vim.keymap.set('n', '<space>ht', gs.toggle_current_line_blame,
            { desc = "[H]istory [T]oggle blame", buffer = bufnr })
    end
}

require("ibl").setup()

require("leap").add_default_mappings()

require("nvim-autopairs").setup {
    check_ts = true,
    ts_config = {},
    disable_filetype = { "TelescopePrompt", "vim" },
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.#]"
}

require("cmp").event:on(
    "confirm_done",
    require "nvim-autopairs.completion.cmp".on_confirm_done()
)

local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local kind_icons = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    formatting = {
        fields = { "abbr", "kind" },
        format = function(_, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
        end
    },
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" }
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false
    },
    experimental = {
        ghost_text = false,
        native_menu = false
    }
}

require("colorizer").setup()

local dap = require("dap")
local DEBUGGER_LOCATION = os.getenv("HOME") .. "/.local/share/dbg/netcoredbg/netcoredbg"

dap.adapters.coreclr = {
    type = "executable",
    command = DEBUGGER_LOCATION,
    args = { "--interpreter=vscode" }
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end
    }
}

vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "Run last" })
vim.keymap.set("n", "<leader>ds", function() dap.step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step out" })

require("nvim-dap-virtual-text").setup()

local lsp_config = require("lspconfig")

local signs = {
    Error = "󰅚 ",
    Warn = "󰀪 ",
    Info = "󰋽 ",
    Hint = "󰌶 "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = " ●"
    }
})

vim.keymap.set("n", "gn", vim.diagnostic.goto_next)
vim.keymap.set("n", "gN", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>l", vim.diagnostic.setloclist, { desc = "Set LOC list" })

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local telescope = require('telescope.builtin')

    local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
    end

    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("gi", telescope.lsp_implementations, "[G]oto [I]mplementation")
    map("<C-s>", vim.lsp.buf.signature_help, "Signature help")
    -- map("<leader>wa", vim.lsp.buf.add_workspace_folder, "")
    -- map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "")
    -- map("<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "")
    map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    map("gr", telescope.lsp_references, "[G]oto [R]eferences")
    map("==", function() vim.lsp.buf.format { async = true } end, "Format code")
end

lsp_config.nil_ls.setup {
    on_attach = on_attach
}

lsp_config.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            completion = {
                keywordSnippet = "Disable",
            },
            diagnostics = {
                globals = { "use", "vim" },
                disable = { "lowercase-global" }
            },
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    }
}

lsp_config.zk.setup {
    cmd = {
        "zk",
        "lsp"
    },
    filetypes = { "markdown" },
    root_dir = function()
        return vim.loop.cwd()
    end,
    on_attach = on_attach
}

lsp_config.rust_analyzer.setup { on_attach = on_attach }
lsp_config.pyright.setup { on_attach = on_attach }
lsp_config.tsserver.setup { on_attach = on_attach }
lsp_config.html.setup { on_attach = on_attach }
lsp_config.cssls.setup { on_attach = on_attach }

lsp_config.svelte.setup { on_attach = on_attach }

lsp_config.omnisharp.setup {
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
    cmd = {
        "OmniSharp",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid())
    },
    on_attach = on_attach
}

require("nvim-surround").setup()

require("nvim-web-devicons").setup {
    override_by_extension = {
        ["csproj"] = {
            name = "CSProj",
            icon = "",
            color = "#017bcd"
        },
        ["rs"] = {
            name = "Rust",
            icon = "",
            color = "#f74c00"
        }
    }
}

require("nvim-tree").setup {
    sync_root_with_cwd = true,
    renderer = {
        special_files = {
            "Cargo.toml",
            "Containerfile",
            "Dockerfile",
            "flake.nix",
            "flake.lock",
            "Makefile",
            "README.md",
            "readme.md"
        },
    },
    filters = {
        custom = {
            "^.git$"
        }
    },
    view = {
        width = 40,
        signcolumn = "no"
    }
}

vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>E", "<CMD>NvimTreeFindFile<CR>", { desc = "Find file in file tree" })

local telescope = require("telescope")

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "%.git/",
            "node_modules/"
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    },
    pickers = {
        find_files = {
            hidden = true
        },
        live_grep = {
            additional_args = function(_) return { "--hidden" } end
        },
        lsp_references = {
            show_line = false
        }
    }
}

telescope.load_extension("ui-select")
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "List open buffers" })
vim.keymap.set("n", "<leader>s", builtin.treesitter, { desc = "Treesiter symbols" })
vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "List diagnostics" })

require("nvim-treesitter.configs").setup {
    ensure_installed = {},
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false
    },
    indent = {
        enable = true
    }
}

local wk = require("which-key")
wk.setup()
wk.register {
    ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
    ["<leader>d"] = { name = "[D]ebug", _ = "which_key_ignore" },
    ["<leader>h"] = { name = "[H]istory", _ = "which_key_ignore" },
    ["<leader>t"] = { name = "[T]ab", _ = "which_key_ignore" },
}

require("statusline")
