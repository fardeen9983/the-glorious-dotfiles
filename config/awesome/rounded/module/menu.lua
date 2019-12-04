-- TO GENERATE MENU YOU NEED TO INSTALL XDG-MENU
-- IF YOURE USING ARCH IT IS CALLED `archlinux-xdg-menu`
-- THEN EXECUTE
-- xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu >~/.config/awesome/archmenu.lua
-- IT WILL GENERATE A MENU LIST IN archmenu.lua
-- Just substitute or transfer the generated list to this module.

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local apps = require('configuration.apps')
local hotkeys_popup = require('awful.hotkeys_popup').widget

terminal = apps.default.terminal
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor


-- Theming Menu
beautiful.menu_font = "SFNS Display Regular 10"
beautiful.menu_submenu = '' -- ➤

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
  { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "Edit config", editor_cmd .. " " .. awesome.conffile },
  { "Restart", awesome.restart },
  { "Quit", function() awesome.quit() end },
}

-- Replace with the list generated by xdg_menu
local a = {
}
local b = {
}
local c = {
}
local d = {
}
local e = {
}
local f = {
}
local g = {
  {"show_script", "notify-send 'Script:' 'xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu >~/.config/awesome/archmenu.lua'"}
}

local screenshot = {
  {"Full", apps.bins.fullShot },
  {"Area", apps.bins.areaShot },
}


local terminal = {
  {"kitty", "kitty"},
  {"xterm", "xterm"},
}

mymainmenu = awful.menu({
  items = {
    {"Terminal", terminal},
    {"Replace", a},
    {"With", b},
    {"the", c},
    {"Apps", d},
    {"Generated", e},
    {"by", f},
    {"xdg_menu", g},
    {"Take a Screenshot", screenshot},
    {"Awesome", myawesomemenu},
    {"End Session", function() _G.exit_screen_show() end},
  }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Embed mouse bindings
root.buttons(gears.table.join(awful.button({ }, 3, function () mymainmenu:toggle() end)))
