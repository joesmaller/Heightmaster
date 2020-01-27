-- Materials Getter
-- Joe (ITBV)
-- January 27, 2020



local module = Instance.new("ModuleScript")

module.Source = [[
return {
]]

for _,enum in pairs(Enum.Material:GetEnumItems()) do
	local success, color = pcall(function()
		return game.Workspace.Terrain:GetMaterialColor(enum)
	end)

	if (success) then
		local string = enum.Name:gsub("Enum.Material.", "")

		module.Source = module.Source .. [[
	["]] .. string .. [["] = {
		text = "]] .. string .. [[";
		enum = Enum.Material.]] .. string .. [[;
		color = Color3.new(]] ..tostring(color.R)..", "..tostring(color.G)..", "..tostring(color.B).. [[);
	};
]]
	end
end

module.Source = module.Source .. "\n};"

module.Parent = game.Workspace