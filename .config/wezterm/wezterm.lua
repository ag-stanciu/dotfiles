local wezterm = require "wezterm"
local act = wezterm.action

local config = wezterm.config_builder()
config:set_strict_mode(true)

local SUPER_SHIFT = "SUPER|SHIFT"

local function mouse_binding(event, streak, button, mods, action)
    return {
        event = { [event] = { streak = streak, button = button } },
        mods = mods,
        action = action,
    }
end

wezterm.on("update-right-status", function(window)
    window:set_right_status(wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Text = wezterm.strftime " %A, %d %B %Y %H:%M " },
    })
end)

-- Font
config.font = wezterm.font_with_fallback {
    { family = "Berkeley Mono Variable", weight = "Regular" },
    { family = "Symbols Nerd Font Mono" },
}
config.font_size = 14
config.line_height = 1.0

-- Window
config.initial_cols = 150
config.initial_rows = 50
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_close_confirmation = "AlwaysPrompt"
config.window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 1,
}
config.inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 0.85,
}
config.audible_bell = "Disabled"
config.scrollback_lines = 10000

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.enable_scroll_bar = false
config.window_frame = {
    font = wezterm.font_with_fallback {
        { family = "Source Code Pro" },
        { family = "JetBrains Mono" },
        { family = "Symbols Nerd Font Mono" },
    },
    font_size = 15.0,
    active_titlebar_bg = "#1a1b26",
    inactive_titlebar_bg = "#16161e",
}

-- Tokyo Night
config.colors = {
    foreground = "#c0caf5",
    background = "#1a1b26",
    cursor_bg = "#c0caf5",
    cursor_border = "#c0caf5",
    cursor_fg = "#1a1b26",
    selection_bg = "#33467c",
    selection_fg = "#c0caf5",
    ansi = {
        "#15161e",
        "#f7768e",
        "#9ece6a",
        "#e0af68",
        "#7aa2f7",
        "#bb9af7",
        "#7dcfff",
        "#a9b1d6",
    },
    brights = {
        "#414868",
        "#f7768e",
        "#9ece6a",
        "#e0af68",
        "#7aa2f7",
        "#bb9af7",
        "#7dcfff",
        "#c0caf5",
    },
    tab_bar = {
        background = "#191b28",
        inactive_tab_edge = "#16161e",
        active_tab = {
            fg_color = "#7aa2f7",
            bg_color = "#1a1b26",
        },
        inactive_tab = {
            fg_color = "#545c7e",
            bg_color = "#16161e",
        },
        inactive_tab_hover = {
            fg_color = "#7aa2f7",
            bg_color = "#16161e",
        },
        new_tab = {
            fg_color = "#7aa2f7",
            bg_color = "#191b28",
        },
        new_tab_hover = {
            fg_color = "#16161e",
            bg_color = "#7aa2f7",
        },
    },
}

-- Keep WezTerm defaults; these entries only add or override deliberate choices.
config.keys = {
    { key = "UpArrow", mods = SUPER_SHIFT, action = act.ActivatePaneDirection "Up" },
    { key = "DownArrow", mods = SUPER_SHIFT, action = act.ActivatePaneDirection "Down" },
    { key = "RightArrow", mods = SUPER_SHIFT, action = act.ActivatePaneDirection "Right" },
    { key = "LeftArrow", mods = SUPER_SHIFT, action = act.ActivatePaneDirection "Left" },
    { key = "t", mods = SUPER_SHIFT, action = act.SpawnTab "CurrentPaneDomain" },
    { key = "\"", mods = SUPER_SHIFT, action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "_", mods = SUPER_SHIFT, action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = ">", mods = SUPER_SHIFT, action = act.MoveTabRelative(1) },
    { key = "<", mods = SUPER_SHIFT, action = act.MoveTabRelative(-1) },
    { key = "M", mods = SUPER_SHIFT, action = act.TogglePaneZoomState },
    { key = "p", mods = SUPER_SHIFT, action = act.PaneSelect { mode = "Activate" } },
    { key = "l", mods = SUPER_SHIFT, action = act.ActivateTabRelative(1) },
    { key = "h", mods = SUPER_SHIFT, action = act.ActivateTabRelative(-1) },
    { key = "C", mods = "CTRL", action = act.CopyTo "ClipboardAndPrimarySelection" },
}

config.mouse_bindings = {
    mouse_binding(
        "Up",
        1,
        "Left",
        "NONE",
        act.CompleteSelection "ClipboardAndPrimarySelection"
    ),
    mouse_binding(
        "Up",
        1,
        "Left",
        "SHIFT",
        act.CompleteSelection "ClipboardAndPrimarySelection"
    ),
    mouse_binding("Up", 1, "Left", "ALT", act.CompleteSelection "ClipboardAndPrimarySelection"),
    mouse_binding(
        "Up",
        1,
        "Left",
        "SHIFT|ALT",
        act.CompleteSelection "ClipboardAndPrimarySelection"
    ),
    mouse_binding("Down", 1, "Left", "SUPER", act.Nop),
    mouse_binding("Up", 1, "Left", "SUPER", act.OpenLinkAtMouseCursor),
    mouse_binding("Up", 2, "Left", "NONE", act.CompleteSelection "ClipboardAndPrimarySelection"),
    mouse_binding("Up", 3, "Left", "NONE", act.CompleteSelection "ClipboardAndPrimarySelection"),
}

config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
    regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
    format = "https://www.github.com/$1/$3",
})

return config
