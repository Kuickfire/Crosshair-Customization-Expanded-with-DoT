return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`Crosshair Customization Expanded with Dot` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("Crosshair Customization Expanded with Dot", {
			mod_script       = "scripts/mods/Crosshair Customization Expanded with Dot/Crosshair Customization Expanded with Dot",
			mod_data         = "scripts/mods/Crosshair Customization Expanded with Dot/Crosshair Customization Expanded with Dot_data",
			mod_localization = "scripts/mods/Crosshair Customization Expanded with Dot/Crosshair Customization Expanded with Dot_localization",
		})
	end,
	packages = {
		"resource_packages/Crosshair Customization Expanded with Dot/Crosshair Customization Expanded with Dot",
	},
}
