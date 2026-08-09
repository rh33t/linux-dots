hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@75", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-1", mode = "1920x1080@60", position = "1920x-120", scale = 1, transform = 1 })

-- Workspace number to monitor assignment
local workspace_outputs = {
	["1"] = "HDMI-A-1",
	["2"] = "HDMI-A-1",
	["3"] = "DP-1",
	["4"] = "DP-1",
	["5"] = "HDMI-A-1",
	["6"] = "DP-1",
	["7"] = "HDMI-A-1",
	["8"] = "DP-1",
	["9"] = "DP-1",
	["10"] = "HDMI-A-1",
	["11"] = "HDMI-A-1",
}

for workspace, monitor in pairs(workspace_outputs) do
	hl.workspace_rule({ workspace = workspace, monitor = monitor })
end
