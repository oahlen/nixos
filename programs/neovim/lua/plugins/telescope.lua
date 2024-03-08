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
