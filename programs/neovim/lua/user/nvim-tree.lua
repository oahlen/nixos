require "nvim-tree".setup {
    sync_root_with_cwd = true,
    renderer = {
        special_files = { "Cargo.toml", "Dockerfile", "Makefile", "README.md", "readme.md" },
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
