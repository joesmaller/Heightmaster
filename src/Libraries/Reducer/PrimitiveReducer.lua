-- Primitive Reducer
-- Joe (ITBV)
-- December 31, 2019



-- Constants
local DEFAULT_STATE = {}

return function(Rodux)
	return Rodux.createReducer(DEFAULT_STATE, {
		PrimitiveAction = function(state, action)
			local newState = {}
			for index, value in pairs(state) do
				newState[index] = value
			end
			return newState
		end;
	})
end