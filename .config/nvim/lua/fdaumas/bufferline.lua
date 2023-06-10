
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
require('bufferline').setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
        custom = {
            all = {
                fill = { bg = "#24273a" },
            },
            macchiato = {
                background = { fg = macchiato.text },
            },
            latte = {
                background = { fg = "#24273a" },
            },
        },
    },
}
