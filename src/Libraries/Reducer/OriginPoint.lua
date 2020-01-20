-- Origin Point
-- Joe (ITBV)
-- January 19, 2020



-- Constants
local DEFAULT_STATE = Vector3.new(0, 0, 0)

return function(Rodux)
	return Rodux.createReducer(DEFAULT_STATE, {
		SetOrigin = function(state, action)
			return action.origin or state
		end;
	})
end