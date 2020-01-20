-- Importer App
-- Joe (ITBV)
-- January 17, 2020



-- Libraries
local Components = require(script.Parent:WaitForChild("Components"))
local Roact
local RoactRodux


-- // Code // --

return function(store, roact, roactRodux)
	Roact = roact
	RoactRodux = roactRodux

	local function getHeightmapImage()
		local state = store:getState()
		if (state.Heightmap) then
			if (state.Heightmap.File) then
				return state.Heightmap.File:GetTemporaryId()
			end
		end
	end

	local function getColormapImage()
		local state = store:getState()
		if (state.Colormap) then
			if (state.Colormap.File) then
				return state.Colormap.File:GetTemporaryId()
			end
		end
	end

	return Roact.createElement(RoactRodux.StoreProvider, {
		store = store;
	}, {
		Body = Roact.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5);
			Size = UDim2.new(1, 0, 1, 0);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground);
		}, {
			Container = Roact.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 1;
				ClipsDescendants = true;
				BorderSizePixel = 0;
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, -20, 1, -20);
			}, {
				ImportContainer = Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0);
					BackgroundTransparency = 1;
					BorderSizePixel = 0;
					Position = UDim2.new(0.5, 0, 0, 0);
					Size = UDim2.new(1, 0, 0.7, 0);
				}, {
					Heightmap = Roact.createElement(Components.SoftBox, {
						Color = Color3.fromRGB(0, 170, 255);
						AnchorPoint = Vector2.new(1, 0.5);
						Position = UDim2.new(0.5, -10, 0.5, 0);
						Size = UDim2.new(1, 0, 1, 0);
						SizeConstraint = Enum.SizeConstraint.RelativeYY;
					}, {
						Button = Roact.createElement(Components.ImporterButton, {
							Image = getHeightmapImage();
							Activated = function(rbx)
								store:dispatch({
									type = "ImportHeightmap"
								})
							end;
						})
					});
					Colormap = Roact.createElement(Components.SoftBox, {
						Color = Color3.fromRGB(255, 85, 0);
						AnchorPoint = Vector2.new(0, 0.5);
						Position = UDim2.new(0.5, 10, 0.5, 0);
						Size = UDim2.new(1, 0, 1, 0);
						SizeConstraint = Enum.SizeConstraint.RelativeYY;
					}, {
						Button = Roact.createElement(Components.ImporterButton, {
							Image = getColormapImage();
							Activated = function(rbx)
								store:dispatch({
									type = "ImportColormap"
								})
							end;
						})
					})
				});
				LoadContainer = Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 1);
					BackgroundTransparency = 1;
					BorderSizePixel = 0;
					Position = UDim2.new(0.5, 0, 1, 0);
					Size = UDim2.new(1, 0, 0.3, 0);
				}, {
					LoadButton = Roact.createElement(Components.PluginButton, {
						AnchorPoint = Vector2.new(0.5, 0.5);
						Position = UDim2.new(0.5, 0, 0.5, 0);
						Size = UDim2.new(0.75, 0, 0.5, 0);

						Text = "Load maps";

						Activated = function(rbx)
							store:dispatch({
								type = "LoadMaps";
							})
						end;
					})
				})
			});
		});
	})
end