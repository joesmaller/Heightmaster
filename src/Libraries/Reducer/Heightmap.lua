-- Heightmap Reducer
-- Joe (ITBV)
-- January 18, 2020



return function(Rodux)
	return Rodux.createReducer({}, {
		ImportHeightmap = function(state, action)
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
			if (action.heightmap) then
				newState.Map = action.heightmap
				newState.Loaded = true;
			end
			return newState
		end;

		ClearHeightmap = function(state, action)
			local newState = {}
			for index, value in pairs(state) do
				if (index ~= "Heightmap" and index ~= "File") then
					newState[index] = value
				end
			end
			newState.Loaded = false;
			return newState
		end;
	})
end