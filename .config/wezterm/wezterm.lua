local wezterm = require "wezterm"
local act = wezterm.action
local mod = "SHIFT|SUPER"

local function make_mouse_binding(dir, streak, button, mods, action)
    return {
        event = { [dir] = { streak = streak, button = button } },
        mods = mods,
        action = action,
    }
end

local colors = {
    rosewater = "#F4DBD6",
    flamingo = "#F0C6C6",
    pink = "#F5BDE6",
    mauve = "#C6A0F6",
    red = "#ED8796",
    maroon = "#EE99A0",
    peach = "#F5A97F",
    yellow = "#EED49F",
    green = "#A6DA95",
    teal = "#8BD5CA",
    sky = "#91D7E3",
    sapphire = "#7DC4E4",
    blue = "#8AADF4",
    lavender = "#B7BDF8",
    text = "#CAD3F5",
    subtext1 = "#B8C0E0",
    subtext0 = "#A5ADCB",
    overlay2 = "#939AB7",
    overlay1 = "#8087A2",
    overlay0 = "#6E738D",
    surface2 = "#5B6078",
    surface1 = "#494D64",
    surface0 = "#363A4F",
    base = "#24273A",
    mantle = "#1E2030",
    crust = "#181926",
}
local function get_process(tab)
    local process_icons = {
        ["brew"] = {
            { Foreground = { Color = colors.blue } },
            { Text = wezterm.nerdfonts.brew },
        },
        ["docker"] = {
            { Foreground = { Color = colors.blue } },
            { Text = wezterm.nerdfonts.linux_docker },
        },
        ["docker-compose"] = {
            { Foreground = { Color = colors.blue } },
            { Text = wezterm.nerdfonts.linux_docker },
        },
        ["nvim"] = {
            { Foreground = { Color = colors.green } },
            { Text = wezterm.nerdfonts.custom_vim },
        },
        ["vim"] = {
            { Foreground = { Color = colors.green } },
            { Text = wezterm.nerdfonts.dev_vim },
        },
        ["node"] = {
            { Foreground = { Color = colors.green } },
            { Text = wezterm.nerdfonts.mdi_hexagon },
        },
        ["zsh"] = {
            { Foreground = { Color = colors.peach } },
            { Text = wezterm.nerdfonts.dev_terminal },
        },
        ["bash"] = {
            { Foreground = { Color = colors.subtext0 } },
            { Text = wezterm.nerdfonts.cod_terminal_bash },
        },
        ["htop"] = {
            { Foreground = { Color = colors.yellow } },
            { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
        },
        ["cargo"] = {
            { Foreground = { Color = colors.peach } },
            { Text = wezterm.nerdfonts.dev_rust },
        },
        ["go"] = {
            { Foreground = { Color = colors.sapphire } },
            { Text = wezterm.nerdfonts.mdi_language_go },
        },
        ["git"] = {
            { Foreground = { Color = colors.peach } },
            { Text = wezterm.nerdfonts.dev_git },
        },
        ["lua"] = {
            { Foreground = { Color = colors.blue } },
            { Text = wezterm.nerdfonts.seti_lua },
        },
        ["wget"] = {
            { Foreground = { Color = colors.yellow } },
            { Text = wezterm.nerdfonts.mdi_arrow_down_box },
        },
        ["curl"] = {
            { Foreground = { Color = colors.yellow } },
            { Text = wezterm.nerdfonts.mdi_flattr },
        },
        ["tmux"] = {
            { Foreground = { Color = colors.blue } },
            { Text = wezterm.nerdfonts.fa_th_large },
        }
    }

    local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

    if process_name == "" then
        process_name = "zsh"
    end

    -- if process_name == "tmux" then
    --     local success, stdout, stderr = wezterm.run_child_process { 'tmux', 'display-message', "-p", "'#S'" }
    --     return wezterm.format(process_icons[process_name] .. " " .. stdout)
    -- end

    return wezterm.format(
        process_icons[process_name]
        or { { Foreground = { Color = colors.sky } }, { Text = string.format("[%s]", process_name) } }
    )
end

local function get_current_working_dir(tab)
    local current_dir = tab.active_pane.current_working_dir
    local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

    return current_dir == HOME_DIR and "  ~"
        or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

wezterm.on("format-tab-title", function(tab)
    return wezterm.format({
        { Attribute = { Intensity = "Half" } },
        -- { Text = string.format(" %s ", tab.tab_index + 1) },
        { Text = string.format(" %s ", "") },
        "ResetAttributes",
        { Text = get_process(tab) },
        { Text = " " },
        { Text = get_current_working_dir(tab) },
        { Foreground = { Color = colors.base } },
        { Text = " ▕" },
    })
end)

wezterm.on("update-right-status", function(window)
    window:set_right_status(wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Text = wezterm.strftime(" %A, %d %B %Y %H:%M ") },
    }))
end)

return {
    -- color_scheme = "tokyonight",
    font = wezterm.font_with_fallback {
            -- { family = "Source Code Pro" },
            { family = "Hasklug Nerd Font" },
            -- { family = "Symbols Nerd Font Mono" }
    },
    font_size = 14,
    line_height = 1.0,
    scrollback_lines = 10000,
    initial_cols = 150,
    initial_rows = 50,
    inactive_pane_hsb = {
        saturation = 1.0,
        brightness = 0.85,
    },
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = true,
    tab_bar_at_bottom = true,
    enable_scroll_bar = false,
    show_tab_index_in_tab_bar = false,
    window_decorations = "RESIZE",
    bold_brightens_ansi_colors = true,
    show_new_tab_button_in_tab_bar = false,
    audible_bell = "Disabled",
    window_close_confirmation = "NeverPrompt",
    window_background_opacity = 0.85,
    macos_window_background_blur = 20,
    window_padding = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 1,
    },
    window_frame = {
        font_size = 13.0,
        font = wezterm.font_with_fallback(
            { family = "Source Code Pro", weight = "Bold" },
            { family = "Symbols Nerd Font Mono" }
        ),
        active_titlebar_bg = "#1a1b26",
        inactive_titlebar_bg = "#16161e",
    },
    colors = {
        foreground = "#c0caf5",
        background = "#1a1b26",
        cursor_bg = "#c0caf5",
        cursor_border = "#c0caf5",
        cursor_fg = "#1a1b26",
        selection_bg = "#33467c",
        selection_fg = "#c0caf5",

        ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
        brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
        tab_bar = {
            -- The color of the inactive tab bar edge/divider
            inactive_tab_edge = "#16161e",
            background = "#191b28",
            active_tab = {
                fg_color = "#7aa2f7",
                bg_color = "#1a1b26",
            },
            inactive_tab = {
                bg_color = "#16161e",
                fg_color = "#545c7e",
            },
            inactive_tab_hover = {
                bg_color = "#16161e",
                fg_color = "#7aa2f7",
            },
            new_tab_hover = {
                fg_color = "#16161e",
                bg_color = "#7aa2f7",
            },
            new_tab = {
                fg_color = "#7aa2f7",
                bg_color = "#191b28",
            },
        },
    },
    disable_default_key_bindings = true,
    keys = {
        { mods = mod,     key = "UpArrow",    action = act.ActivatePaneDirection("Up") },
        { mods = mod,     key = "DownArrow",  action = act.ActivatePaneDirection("Down") },
        { mods = mod,     key = "RightArrow", action = act.ActivatePaneDirection("Right") },
        { mods = mod,     key = "LeftArrow",  action = act.ActivatePaneDirection("Left") },
        { mods = mod,     key = "t",          action = act.SpawnTab("CurrentPaneDomain") },
        { mods = mod,     key = "\"",         action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
        { mods = mod,     key = "_",          action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
        { mods = mod,     key = ">",          action = act.MoveTabRelative(1) },
        { mods = mod,     key = "<",          action = act.MoveTabRelative(-1) },
        { mods = mod,     key = "M",          action = act.TogglePaneZoomState },
        { mods = mod,     key = "p",          action = act.PaneSelect({ alphabet = "", mode = "Activate" }) },
        { mods = mod,     key = "C",          action = act.CopyTo("ClipboardAndPrimarySelection") },
        { mods = mod,     key = "l",          action = wezterm.action({ ActivateTabRelative = 1 }) },
        { mods = mod,     key = "h",          action = wezterm.action({ ActivateTabRelative = -1 }) },
        -- { mods = mod, key = "v",          action = act.PasteFrom("Clipboard") },
        { mods = "SUPER", key = "v",          action = act.PasteFrom("Clipboard") },
        { key = "C",      mods = "CTRL",      action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
        { key = "w",      mods = "SUPER",     action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
        { key = "n",      mods = "SUPER",     action = "SpawnWindow" },
        {
            key = "t",
            mods = "SUPER",
            action = act.Multiple { act.SendKey { key = "a", mods = "CTRL" }, act
                .SendKey { key = "c" } }
        },
        {
            key = "x",
            mods = "SUPER",
            action = act.Multiple { act.SendKey { key = "a", mods = "CTRL" }, act
                .SendKey { key = "x" } }
        },
        {
            key = "s",
            mods = "SUPER",
            action = act.Multiple { act.SendKey { key = "a", mods = "CTRL" }, act
                .SendKey { key = "s" } }
        }
    },
    mouse_bindings = {
        make_mouse_binding("Up", 1, "Left", "NONE",
            wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor("ClipboardAndPrimarySelection")),
        make_mouse_binding("Up", 1, "Left", "SHIFT",
            wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor("ClipboardAndPrimarySelection")),
        make_mouse_binding("Up", 1, "Left", "ALT", wezterm.action.CompleteSelection("ClipboardAndPrimarySelection")),
        make_mouse_binding("Up", 1, "Left", "SHIFT|ALT",
            wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor("ClipboardAndPrimarySelection")),
        make_mouse_binding("Up", 2, "Left", "NONE", wezterm.action.CompleteSelection("ClipboardAndPrimarySelection")),
        make_mouse_binding("Up", 3, "Left", "NONE", wezterm.action.CompleteSelection("ClipboardAndPrimarySelection")),
    },
    hyperlink_rules = {
        -- Linkify things that look like URLs and the host has a TLD name.
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
            regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
            format = "$0",
        },

        -- linkify email addresses
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
            regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
            format = "mailto:$0",
        },

        -- file:// URI
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
            regex = [[\bfile://\S*\b]],
            format = "$0",
        },

        -- Linkify things that look like URLs with numeric addresses as hosts.
        -- E.g. http://127.0.0.1:8000 for a local development server,
        -- or http://192.168.1.1 for the web interface of many routers.
        {
            regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
            format = "$0",
        },

        -- Make username/project paths clickable. This implies paths like the following are for GitHub.
        -- As long as a full URL hyperlink regex exists above this it should not match a full URL to
        -- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
        {
            regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
            format = "https://www.github.com/$1/$3",
        },
    },
}
