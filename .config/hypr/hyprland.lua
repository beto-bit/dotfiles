-- Monitors
hl.monitor {
    output      = "",
    mode        = "preferred",
    position    = "auto",
    scale       = "auto",
}


-- Env
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-- Programs
local terminal = "kitty"
local menu = "rofi -show drun -show-icons"


-- Autostart
hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)


-- Binds
local mainMod = "SUPER"

-- Main binds
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + B", hl.dsp.window.float{ action = "toggle" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp -d)\" - | wl-copy"))

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move{ workspace = "special:magic" })

-- Focus binds
hl.bind(mainMod .. " + left", hl.dsp.focus{ direction = "left" })
hl.bind(mainMod .. " + right", hl.dsp.focus{ direction = "right" })
hl.bind(mainMod .. " + up", hl.dsp.focus{ direction = "up" })
hl.bind(mainMod .. " + down", hl.dsp.focus{ direction = "down" })

-- Move and resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspace binds
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus{ workspace = i })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move{ workspace = i })
end


-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("pidof wlogout || wlogout"))


-- Paste history
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(
    "cliphist list" ..
    "| rofi -dmenu -display-columns 2" ..
    "| cliphist decode" ..
    "| wl-copy" ..
    "&& wtype -M ctrl v -m ctrl"
))

hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(
    "cliphist list" ..
    "| rofi -dmenu -display-columns 2" ..
    "| cliphist decode" ..
    "| wl-copy" ..
    "&& wtype -M shift -M ctrl v -m ctrl -m shift"
))


-- General config
hl.config {
    general = {
        gaps_in = 5,
        gaps_out = 12,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        }
    },

    decoration = {
        rounding = 10,
        rounding_power = 1.6,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    -- Input
    input = {
        kb_layout = "us,latam",
        kb_options = "grp:win_space_toggle",
        follow_mouse = 1,
        touchpad = { natural_scroll = true  },
        numlock_by_default = true,
    },

    -- Misc
    misc = {
        force_default_wallpaper = 0,
    }
}

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
