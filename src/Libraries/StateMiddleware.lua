-- State Middleware
-- Joe (ITBV)
-- December 31, 2019



-- Constants
local LIBRARIES = script.Parent

-- Libraries
local Rodux = require(script.Parent:WaitForChild("Rodux"))
local Importer = require(LIBRARIES:WaitForChild("Importer"))
local Generator = require(LIBRARIES:WaitForChild("Generator"))


--// Code //--

return {
	function(nextDispatch, store)
		return function(action)
			if (action.type == "ImportHeightmap") then
				action.file = Importer.promptImport()
			elseif (action.type == "ImportColormap") then
				action.file = Importer.promptImport()
			elseif (action.type == "LoadMaps") then
				local heightmap
				local colormap
				local state = store:getState()
				if (state.Heightmap.File) then
					heightmap = Importer.convertPNG(state.Heightmap.File)
					print("Loaded heightmap")
				end
				if (state.Colormap.File) then
					colormap = Importer.convertPNG(state.Colormap.File)
					print("Loaded colormap")
				end
				action.heightmap = heightmap
				action.colormap = colormap
			elseif (action.type == "GenerateTerrain") then
				local heightmap
				local colormap
				local state = store:getState()
				if (state.Heightmap) then
					heightmap = state.Heightmap.Map
				end
				if (state.Colormap) then
					colormap = state.Colormap.Map
				end
				if (heightmap) then
					Generator.Generate(heightmap, colormap, store)
				end
			end
			return nextDispatch(action)
		end
	end;
}