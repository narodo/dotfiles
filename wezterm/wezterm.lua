-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- Mouse
config.hide_mouse_cursor_when_typing = false
-- Intial Size
config.initial_cols = 120
config.initial_rows = 28

-- Fonts
config.font_size = 12
config.font = wezterm.font 'FiraCode Nerd Font Mono'

-- Color
config.color_scheme = 'Gruvbox'

-- Tab bar
config.use_fancy_tab_bar = true

-- Window frame
config.window_frame = {
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },
    font_size = 12.0,

    active_titlebar_bg = '#333333',
    inactive_titlebar_bg = '#333333',
}

-- Key bindings
config.keys = {
    { key = '{', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
    { key = '}', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },

    {
        key = 'r',
        mods = 'CTRL|SHIFT',
        action = act.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },
}

-- Custom functions
function tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- Otherwise, use the title from the active pane
    -- in that tab
    return tab_info.active_pane.title
end

-- Change tab color if we run an ssh session
wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local title = tab_title(tab)
        local process_name = tab.active_pane.foreground_process_name
        -- local title = tab.active_pane.title
        local is_ssh = process_name:match('ssh$')

        local bg_color = is_ssh and 'yellow' or 'green'
        local fg_color = is_ssh and 'black' or 'white'
        local sshMark = is_ssh and '@' or ' '

        if tab.is_active then
            return {
                { Background = { Color = bg_color } },
                { Foreground = { Color = fg_color } },
                { Text = sshMark .. title .. ' ' },
            }
        end
    --
        return title
    end
)

return config
