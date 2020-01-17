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

	return Roact.createElement(RoactRodux.StoreProvider, {
		store = store;
	}, {
		Body = Roact.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5);
			Size = UDim2.new(1, 0, 1, 0);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground);
		}, {
			Frame = Roact.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0);
				BackgroundTransparency = 1;
				BorderSizePixel = 0;
				Position = UDim2.new(0.5, 0, 0, 20);
				Size = UDim2.new(1, -20, 0.5, 0);
			}, {
				Heightmap = Roact.createElement(Components.SoftBox, {
					Color = Color3.fromRGB(0, 170, 255);
					AnchorPoint = Vector2.new(1, 0.5);
					Position = UDim2.new(0.5, -10, 0.5, 0);
					Size = UDim2.new(1, 0, 1, 0);
					SizeConstraint = Enum.SizeConstraint.RelativeYY;
				}, {

				});
				Colormap = Roact.createElement(Components.SoftBox, {
					Color = Color3.fromRGB(255, 85, 0);
					AnchorPoint = Vector2.new(1, 0.5);
					Position = UDim2.new(0.5, -10, 0.5, 0);
					Size = UDim2.new(1, 0, 1, 0);
					SizeConstraint = Enum.SizeConstraint.RelativeYY;
				}, {
					
				})
			})
		});
	})
end