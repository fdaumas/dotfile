local settings = {
    -- every line should be same width without escaped \
    header = {
        default_color = "#b7bdf8",
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 2,
        content = {
 " ／| 、    ",
 "（ﾟ､｡ ７   ",
 " |、  ~ヽ  ",
 " じしf_,)ノ"       },
        highlight = "Statement",
        oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 2,
        content = {
            { " Find File", "Telescope find_files", "<space>+ff" },
            { " Find Word", "Telescope live_grep", "<space>+fg" },
            { " Recent Files", "Telescope oldfiles", "<space>+fo" },
            { " Go To Config", "", "<space>+cf" },
        },
        highlight = "String",
        default_color = "#a6da95",
        oldfiles_amount = 0,
    },
    footer = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 2,
        content = { "Hi have a good day ^^ UwU " },
        highlight = "Number",
        default_color = "",
        oldfiles_amount = 0,
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = { "header", "body", "footer" },
}
return settings
