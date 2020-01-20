-- Heightmap Scale
-- Joe (ITBV)
-- January 19, 2020



-- Constants
local DEFAULT_STATE = 50

return function(Rodux)
	return Rodux.createReducer(DEFAULT_STATE, {
		SetScale = function(state, action)
			return action.scale or state
		end;
	})
end