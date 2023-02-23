local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local home = os.getenv("HOME")

user_vars = {

    layouts = {
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.floating,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.corner.nw,
        awful.layout.suit.corner.ne,
        awful.layout.suit.corner.sw,
        awful.layout.suit.corner.se,
        awful.layout.suit.magnifier,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.spiral.dwindle,
    },
    terminal = "alacritty",
    editor = "nvim",
    modkey = "Mod4"
}
