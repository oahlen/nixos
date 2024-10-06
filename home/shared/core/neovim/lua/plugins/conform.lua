require("conform").setup({
    formatters_by_ft = {
        fish = { "fish_indent" },
        json = { "jq" },
        nix = { "alejandra" }
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = false,
    },
})
