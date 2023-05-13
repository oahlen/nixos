vim.cmd.colorscheme("iceberg")

require "user.options"
require "user.keymaps"
require "user.telescope"
require "user.lsp"
require "user.cmp"
require "user.treesitter"
require "user.nvim-tree"
require "user.gitsigns"
require "user.autopairs"
require "user.statusline"

require "mason".setup()
require "leap".add_default_mappings()
require "nvim-surround".setup()

require "indent_blankline".setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require "Comment".setup()
require "colorizer".setup()
