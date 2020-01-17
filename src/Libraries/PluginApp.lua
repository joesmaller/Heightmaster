-- Plugin App
-- Joe (ITBV)
-- January 9, 2020


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
		});
	})
end