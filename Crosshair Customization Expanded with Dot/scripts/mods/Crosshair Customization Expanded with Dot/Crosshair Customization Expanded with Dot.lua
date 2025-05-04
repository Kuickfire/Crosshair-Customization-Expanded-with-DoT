local mod = get_mod("Crosshair Customization Expanded with Dot")

mod.SETTING_NAMES = {
    HIT_MARKERS_DOVERT_COLOR_GROUP = "HIT_MARKERS_DOVERT_COLOR_GROUP",
    HIT_MARKERS_DOVERT_RED = "HIT_MARKERS_DOVERT_RED",
    HIT_MARKERS_DOVERT_GREEN = "HIT_MARKERS_DOVERT_GREEN",
    HIT_MARKERS_DOVERT_BLUE = "HIT_MARKERS_DOVERT_BLUE",
    IGNORE_TRESHOLD_DOVERT = "IGNORE_TRESHOLD_DOVERT"
}
    local damage_type
    mod:hook_safe(GenericHitReactionExtension, "_execute_effect", function(self, unit, effect_template, biggest_hit, parameters, ...)
    damage_type = biggest_hit[DamageDataIndex.DAMAGE_TYPE]
    end)


-- Hook into hit marker display logic to apply color for DoT damage types
mod:hook_safe(CrosshairUI, "configure_hit_marker_color_and_size", function(self, hit_marker, hit_marker_data)
    local friendly_fire = hit_marker_data.friendly_fire
    local added_dot = hit_marker_data.added_dot
    local is_critical = false
	local is_armored = false
    local hm_rot_texture = hit_marker.style.rotating_texture
    local hm_color = hm_rot_texture.color
    local is_dovert = (damage_type == "arrow_poison_dot" or damage_type == "bleed" or damage_type == "burninating")
    local color_set = false

    if not is_dovert or friendly_fire then
        color_set = true
    end

    if not color_set and is_dovert then
        if mod:get(mod.SETTING_NAMES.HIT_MARKERS_DOVERT_COLOR_GROUP) then
            hm_color[2] = mod:get(mod.SETTING_NAMES.HIT_MARKERS_DOVERT_RED)
            hm_color[3] = mod:get(mod.SETTING_NAMES.HIT_MARKERS_DOVERT_GREEN)
            hm_color[4] = mod:get(mod.SETTING_NAMES.HIT_MARKERS_DOVERT_BLUE)
            hm_color[1] = 255
        end
    end
end)

-- Hide hit markers if damage is below a user-defined threshold
mod:hook(CrosshairUI, "update_hit_markers", function(func, self, ...)
    local player_unit = self.local_player.player_unit
    local hud_extension = ScriptUnit.extension(player_unit, "hud_system")
    local hit_marker_data = hud_extension.hit_marker_data

    if hit_marker_data.hit_enemy then
        local damage_amount = hit_marker_data.damage_amount
        if damage_amount < mod:get(mod.SETTING_NAMES.IGNORE_TRESHOLD_DOVERT) then
            hit_marker_data.hit_enemy = false
        end
    end

    func(self, ...)
end)
