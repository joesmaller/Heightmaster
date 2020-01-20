-- Importer
-- Joe (ITBV)
-- January 18, 2020

--[[



--]]


local Importer = {}


-- Constants
local FILE_TYPES = {"png"}
local LIBRARIES = script.Parent

-- Services
local Studio = settings().Studio
local StudioService = game:GetService("StudioService")

-- Libraries
local PNG = require(LIBRARIES:WaitForChild("PNG"))


--// Code //--


-- Prompts the import of an image
function Importer.promptImport()
	local success, file = pcall(function()
		return StudioService:PromptImportFile(FILE_TYPES)
	end)
	if (success) then
		return file
	end
end


-- Convert file into usable data
function Importer.convertPNG(file)
	local binaryContent = file:GetBinaryContents()
	local image = PNG.new(binaryContent)
	local map = {}
	for x = 1, image.Width do
		map[x] = {}
		for y = 1, image.Height do
			local color = image:GetPixel(x, y)
			map[x][y] = color
		end
	end
	return map
end

return Importer