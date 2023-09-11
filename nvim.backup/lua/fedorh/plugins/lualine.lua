local status, lualine = pcall(require, "lualine")

if not status then
    return
end

local theme = require("lualine.themes.nightfly")

local new_colors = {
    blue = "#65D1FF",
    green = "#3EFFDC",
    violet = "#FF61EF",
    yellow = "#FFDA7B",
    black = "#000000"
}

theme.normal.a.bg = new_colors.blue
theme.insert.a.bg = new_colors.green
theme.visual.a.bg = new_colors.violet
theme.command = {
    a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black,
    },
}



lualine.setup({
    options = {
        theme = theme
    }
})
