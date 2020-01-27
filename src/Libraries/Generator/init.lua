-- Generator
-- Joe (ITBV)
-- January 19, 2020



local Generator = {}


-- Constants
local VOXEL_SCALE = 4
local GENERATE_Y_FACTOR = 128
local TINY_NUMBER = 0.00001

-- Services
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Terrain = Workspace:WaitForChild("Terrain")

-- Modules
local Materials = require(script:WaitForChild("Materials"))


--// Code //--

local function create3dTable(size)
	local ret = {};
	for x = 1, size.X do
		ret[x] = {};
		for y = 1, size.Y do
			ret[x][y] = {};
		end
	end
	return ret;
end

local function inverseLerp(value, minValue, maxValue)
	if value > maxValue then
		return 1
	elseif value < minValue then
		return 0
	end
	return (value - minValue) / (maxValue - minValue)
end

-- Returns the nearest material to the color
function Generator.getMaterialFromColor(color, state)
	assert(typeof(color) == "Color3", "Argument #1 (color) must be Color3 value")

	local materials = {}
	local rgb = Vector3.new(color.R * 255, color.G * 255, color.B * 255)
	local r, g, b = rgb.X, rgb.Y, rgb.Z

	for index, material in pairs(Materials) do
		if (not state.DisabledMaterials[index]) then
			local materialVector = Vector3.new(material.color.R * 255, material.color.G * 255, material.color.B * 255)

			local distance = math.sqrt(
				(materialVector.X - r) ^ 2 +
				(materialVector.Y - g) ^ 2 +
				(materialVector.Z - b) ^ 2
			)
			table.insert(materials, {index, distance})
		end
	end

	table.sort(materials, function(A, B)
		return A[2] < B[2]
	end)

	return Materials[materials[1][1]].enum
end

function Generator.Generate(heightmap, colormap, store)
	assert(type(heightmap) == "table", "Argument #1 (heightmap) must be a valid heightmap")

	local state = store:getState()

	local heightmapWidth = #heightmap
	local heightmapHeight = #heightmap[1]

	Terrain:Clear()
	
	for x, row in ipairs(heightmap) do
		for y, value in ipairs(row) do
			local height = (value.R / 255)
			
			-- Get the material color
			local material = Enum.Material.Water
			if (colormap) then
				if (colormap[x]) then
					if (colormap[x][y]) then
						local color = colormap[x][y]
						material = Generator.getMaterialFromColor(color, state)
					end
				end
			end

			local originPoint = state.OriginPoint
			local scale = state.Scale
			local terrainHeight = (height * scale) * VOXEL_SCALE
			
			local region = Region3.new(
				Vector3.new(
					-((heightmapWidth / 2) * VOXEL_SCALE) + (x * VOXEL_SCALE),
					originPoint.Y,
					-((heightmapWidth / 2) * VOXEL_SCALE) + (y * VOXEL_SCALE)
				),
				Vector3.new(
					(-((heightmapWidth / 2) * VOXEL_SCALE) + (x * VOXEL_SCALE)) + VOXEL_SCALE,
					terrainHeight,
					(-((heightmapWidth / 2) * VOXEL_SCALE) + (y * VOXEL_SCALE)) + VOXEL_SCALE
				)
			):ExpandToGrid(VOXEL_SCALE)

			local materials = create3dTable(region.Size / VOXEL_SCALE)
			local occupancies = create3dTable(region.Size / VOXEL_SCALE)

			local regSize = region.Size / VOXEL_SCALE

			for regX = 1, regSize.X do
				for regY = 1, regSize.Y do
					local occupancy = 1
					local mat = Enum.Material.Rock
					if (regY >= (regSize.Y - 3)) then
						mat = material
						occupancy = ((height * scale) % 1)
						if (occupancy == 0) then
							occupancy = 1
						end
					end
					for regZ = 1, regSize.Z do
						materials[regX][regY][regZ] = mat
						occupancies[regX][regY][regZ] = occupancy
					end
				end
			end

			Terrain:WriteVoxels(region, VOXEL_SCALE, materials, occupancies)

			if (y % GENERATE_Y_FACTOR == 0) then
				RunService.Heartbeat:Wait()
			end
		end
		RunService.Heartbeat:Wait()
	end

end


return Generator