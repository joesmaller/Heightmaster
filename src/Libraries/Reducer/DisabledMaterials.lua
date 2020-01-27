-- DisabledMaterials
-- Joe (ITBV)
-- January 27, 2020



-- Constants
local DEFAULT_STATE = {
	Water = true;
	CrackedLava = true;
	Brick = true;
	WoodPlanks = true;
}

return function(Rodux)
	return Rodux.createReducer(DEFAULT_STATE, {
		PrimitiveAction = function(state, action)
			local newState = {}
			for index, value in pairs(state) do
				newState[index] = value
			end
			return newState
		end;
		DisableMaterial = function(state, action)
			local newState = {}
			for index, value in pairs(state) do
				newState[index] = value
			end
			newState[action.Material] = true
			return newState
		end;
		EnableMaterial = function(state, action)
			local newState = {}
			for index, value in pairs(state) do
				if not (index == action.Material) then
					newState[index] = value
				end
			end
			return newState
		end;
	})
end