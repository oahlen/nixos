local theme = {
    fill = { bg = "#0f1117", fg = "#f2e9de" },
    head = { bg = "#b4be82", fg = "#161821" },
    current_tab = { bg = "#818596", fg = "#17171b" },
    tab = { bg = "#2e313f", fg = "#6b7089" },
    win = { bg = "#2e313f", fg = "#6b7089" },
    tail = { bg = "#818596", fg = "#17171b" },
}
require("tabby.tabline").set(function(line)
    return {
        {
            { "  ", hl = theme.head },
            line.sep("", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
                line.sep("", hl, theme.fill),
                tab.is_current() and " " or " ",
                tab.name(),
                line.sep("", hl, theme.fill),
                hl = hl,
                margin = " ",
            }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
                line.sep("", theme.win, theme.fill),
                win.is_current() and "" or "",
                win.buf_name(),
                line.sep("", theme.win, theme.fill),
                hl = theme.win,
                margin = " ",
            }
        end),
        {
            line.sep("", theme.tail, theme.fill),
            { "   ", hl = theme.tail },
        },
        hl = theme.fill,
    }
end, {
    tab_name = {
        name_fallback = function(tabid)
            return tabid
        end
    },
    buf_name = {
        mode = "tail",
    }
})
