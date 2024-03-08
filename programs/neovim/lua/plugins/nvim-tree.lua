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
