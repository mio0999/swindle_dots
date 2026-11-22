-- general
sloppy_focus               = true
bypass_surface_visibility  = false
log_level                  = "error"  -- "silent", "error", "info", "debug"

-- appearance
appearance = {
    inner_border_px     = 3,
    outer_border_px     = 3,
    gaps                = 35,
    smart_gaps          = false,
    root_color          = 0xb3a1dbff,
    inner_border_color  = 0xffffffff,
    inner_focus_color   = 0xE5C4F3ff,
    inner_urgent_color  = 0xffffffff,
    outer_border_color  = 0x4a3f72ff,
    outer_focus_color   = 0x4a3f72ff,
    outer_urgent_color  = 0x4a3f72ff,
    fullscreen_bg       = 0xb3a1dbff,
    inactive_opacity    = 1.0,
    active_opacity      = 1.0,
}

-- input
input = {
    repeat_rate             = 50,
    repeat_delay            = 150,
    tap_to_click            = true,
    tap_and_drag            = true,
    drag_lock               = true,
    natural_scrolling       = false,
    disable_while_typing    = true,
    left_handed             = false,
    middle_button_emulation = false,
    scroll_method           = "2fg",          -- "2fg", "edge", "button"
    click_method            = "button_areas", -- "button_areas", "clickfinger"
    accel_profile           = "adaptive",     -- "adaptive", "flat"
    accel_speed             = 0.0,
}

-- window rules
rules = {
--   { app_id = "Gimp",    floating = true,  monitor = -1 },
--   { app_id = "firefox", tags = 1 << 8,    floating = false, monitor = -1 },
}

-- monitors
monitors = {
    { name = nil, mfact = 0.55, nmaster = 1, scale = 1.0,
      layout = "dwindle", x = -1, y = -1 },
}

-- autostart
autostart = {
    "dbus-update-activation-environment WAYLAND_DISPLAY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP",
    [[sh -c 'pkill -x waybar; pkill -x swaybg; pkill -x pipewire-pulse; pkill -x wireplumber; pkill -x pipewire; sleep 1; pipewire & wireplumber & pipewire-pulse & sleep 2; waybar & swaybg -i ~/mios_wallpapers/purplepainting.jpg -m stretch &']],
    [[sh -c 'sleep 2; o=$(wlr-randr | awk "/^HDMI/{print \$1;exit}"); [ -n "$o" ] && wlr-randr --output "$o" --on --mode 1920x1080@120Hz --pos 0,0 --output eDP-1 --off']],
}

-- keybinds
keybinds = {
    -- apps
    { mods = {"logo"},          key = "Return", action = "spawn", args = {"foot"} },
    { mods = {"logo"},          key = "space",  action = "spawn", args = {"wofi", "--show", "drun"} },
    { mods = {"logo", "shift"}, key = "S",      action = "spawn", args = {"sh", "-c", "grim ~/screenshots/$(date +%Y%m%d_%Hh%Mm%Ss)_grim.png"} },

    -- windows
    { mods = {"logo"},          key = "q",      action = "killclient" },
    { mods = {"logo"},          key = "f",      action = "togglefullscreen" },
    { mods = {"logo", "shift"}, key = "Q",      action = "quit" },

    -- focus
    { mods = {"logo"},          key = "Left",   action = "focusdir", args = {"left"} },
    { mods = {"logo"},          key = "Down",   action = "focusdir", args = {"down"} },
    { mods = {"logo"},          key = "Up",     action = "focusdir", args = {"up"} },
    { mods = {"logo"},          key = "Right",  action = "focusdir", args = {"right"} },

    -- move window
    { mods = {"logo", "shift"}, key = "Left",   action = "swapdir",  args = {"left"} },
    { mods = {"logo", "shift"}, key = "Down",   action = "swapdir",  args = {"down"} },
    { mods = {"logo", "shift"}, key = "Up",     action = "swapdir",  args = {"up"} },
    { mods = {"logo", "shift"}, key = "Right",  action = "swapdir",  args = {"right"} },

    -- volume
    { mods = {"ctrl"}, key = "Up",   action = "spawn", args = {"wpctl", "set-volume", "-l", "1.0", "@DEFAULT_AUDIO_SINK@", "5%+"} },
    { mods = {"ctrl"}, key = "Down", action = "spawn", args = {"wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%-"} },
    -- { mods = {}, key = "XF86AudioMute",         action = "spawn", args = {"wpctl", "set-mute", "@DEFAULT_AUDIO_SINK@", "toggle"} },
    -- { mods = {}, key = "XF86AudioMicMute",      action = "spawn", args = {"wpctl", "set-mute", "@DEFAULT_AUDIO_SOURCE@", "toggle"} },

    -- brightness
    { mods = {}, key = "XF86MonBrightnessUp",   action = "spawn", args = {"brightnessctl", "set", "5%+"} },
    { mods = {}, key = "XF86MonBrightnessDown", action = "spawn", args = {"brightnessctl", "set", "5%-"} },
}

-- tags
for i = 1, 9 do
    local key  = tostring(i)
    local mask = 1 << (i - 1)
    table.insert(keybinds, { mods = {"logo"},          key = key, action = "view", args = {tostring(mask)} })
    table.insert(keybinds, { mods = {"logo", "shift"}, key = key, action = "tag",  args = {tostring(mask)} })
end

-- mouse
buttons = {
    { mods = {"logo"}, button = "left",   action = "moveresize",     args = {"move"} },
    { mods = {"logo"}, button = "middle", action = "togglefloating" },
    { mods = {"logo"}, button = "right",  action = "moveresize",     args = {"resize"} },
}
