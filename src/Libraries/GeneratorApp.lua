-- Generator App
-- Joe (ITBV)
-- January 17, 2020



-- Services
local Studio = settings().Studio
local Theme = Studio.Theme

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
			BackgroundColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground);
		}, {
			GeneratorButton = Roact.createElement(Components.PluginButton, {
				AnchorPoint = Vector2.new(0.5, 1);
				Position = UDim2.new(0.5, 0, 0.5, -20);
				Size = UDim2.new(1, -40, 0.5, -40);

				Text = "Generate";

				Activated = function(rbx)
					store:dispatch({
						type = "GenerateTerrain";
					})
				end;
			});
			Scale = Roact.createElement(Components.TextBox, {
				AnchorPoint = Vector2.new(0.5, 0);
				Position = UDim2.new(0.5, 0, 0.5, 20);
				Size = UDim2.new(1, -40, 0.5, -40);

				Text = store:getState().Scale;
				TextColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.MainText);
					
				Shadow = true;
				ShadowOffset = Vector2.new(1, 1);

				TextChanged = function(rbx)
					return rbx.Text:gsub("%D+", "")
				end;

				FocusLost = function(rbx)
					store:dispatch({
						type = "SetScale";
						scale = rbx.Text
					})
				end;
			})
		});
	})
end