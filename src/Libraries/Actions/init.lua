-- Actions
-- Joe (ITBV)
-- December 31, 2019



local Actions = {}

for _,module in pairs(script:GetChildren()) do
	if (module:IsA("ModuleScript")) then
		Actions[module.Name] = require(module)
	end
end

return Actions