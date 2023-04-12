require "nvim-autopairs".setup {
    check_ts = true,
    ts_config = {},
    disable_filetype = { "TelescopePrompt", "vim" },
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.#]" -- will ignore alphanumeric and `.` symbol
}

require "cmp".event:on(
    "confirm_done",
    require "nvim-autopairs.completion.cmp".on_confirm_done()
)
