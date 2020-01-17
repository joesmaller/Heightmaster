-- Reducer
-- Joe (ITBV)
-- December 31, 2019



return function(Rodux)
	local reducers = {}

	for _,module in pairs(script:GetChildren()) do
		if (module:IsA("ModuleScript")) then
			reducers[module.Name] = require(module)(Rodux)
		end
	end

	return Rodux.combineReducers(reducers)
end