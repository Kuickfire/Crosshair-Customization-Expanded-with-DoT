local mod = get_mod("Crosshair Customization Expanded with Dot")

return {
    name = "Crosshair Customization Expanded with Dot",
    description = "Adds the possibility to customize the hitmarker for DoT", 
    is_togglable = true,
    options = {
        widgets = {
            {
                setting_id = "HIT_MARKERS_DOVERT_COLOR_GROUP",
                type = "checkbox",
                text = "HIT_MARKERS_DOVERT_COLOR_GROUP",
                tooltip = "HIT_MARKERS_DOVERT_COLOR_GROUP_T",
                default_value = false,
                sub_widgets = {
                    {
                        setting_id = "HIT_MARKERS_DOVERT_RED",
                        type = "numeric",
                        tooltip = "custom_red_tooltip",
                        range = {0, 255},
                        default_value = 170,
                    },
                    {
                        setting_id = "HIT_MARKERS_DOVERT_GREEN",
                        type = "numeric",
                        tooltip = "custom_green_tooltip",
                        range = {0, 255},
                        default_value = 25,
                    },
                    {
                        setting_id = "HIT_MARKERS_DOVERT_BLUE",
                        type = "numeric",
                        tooltip = "custom_blue_tooltip",
                        range = {0, 255},
                        default_value = 255,
                    },
                }
            },
            {
                setting_id = "IGNORE_TRESHOLD_DOVERT",
                type = "numeric",
                text = "IGNORE_TRESHOLD_DOVERT",
                tooltip = "IGNORE_TRESHOLD_DOVERT_T",
                range = {0, 50},
                decimals_number = 1,
                default_value = 0,
            }
        }
    }
}