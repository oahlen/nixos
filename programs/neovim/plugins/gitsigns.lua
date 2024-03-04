require "gitsigns".setup {
    signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<space>hb", function() gs.blame_line { full = true } end, opts)
    end
}
