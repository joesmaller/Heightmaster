-- Colormap Reducer
-- Joe (ITBV)
-- January 18, 2020



return function(Rodux)
	return Rodux.createReducer({}, {
		ImportColormap = function(state, action)
			local newState = {}
			for index, value in pairs(state) do
				newState[index] = value
			end
			newState.File = action.file
			return newState
		end;

		LoadMaps = function(state, action)
			local newState = {}
			for index, value in pairs(state) do
				newState[index] = value
			end
			if (action.colormap) then
				newState.Map = action.colormap
				newState.Loaded = true;
			end
			return newState
		end;

		ClearColormap = function(state, action)
			local newState = {}
			for index, value in pairs(state) do
				if (index ~= "Colormap" and index ~= "File") then
					newState[index] = value
				end
			end
			newState.Loaded = false;
			return newState
		end;
	})
end