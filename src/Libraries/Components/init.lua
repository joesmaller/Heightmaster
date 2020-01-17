-- Components
-- Joe (ITBV)
-- December 31, 2019



local Components = {}

-- Libraries
local Roact = require(script.Parent:WaitForChild("Roact"))
local RoactRodux = require(script.Parent:WaitForChild("RoactRodux"))


for _,module in pairs(script:GetChildren()) do
	if (module:IsA("ModuleScript")) then
		Components[module.Name] = require(module)(Roact, RoactRodux)
	end
end

return Components