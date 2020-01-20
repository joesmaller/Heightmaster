-- Text Shadow
-- Joe (ITBV)
-- January 9, 2020

--[[

	Properties:

		[bool]		Shadow
		[color3]	ShadowColor
		[vecto2]	ShadowOffset

		[vector2]	AnchorPoint
		[udim2]		Position
		[udim2]		Size
		[integer]	ZIndex

]]

return function(Roact)
	return function(props)

		local shadowOffset = Vector2.new(0, 0)
		if (props.ShadowOffset) then
			assert(typeof(props.ShadowOffset) == "Vector2", "ShadowOffset must be a Vector2")
			shadowOffset = props.ShadowOffset
		end

		return Roact.createElement("TextLabel", {
			-- TextLabel
			Font = props.Font or Enum.Font.Gotham;
			LineHeight = props.LineHeight or 1;
			Text = props.Text or "";
			--TextBounds = props.TextBounds or Vector2.new(0, 0);
			TextColor3 = props.ShadowColor or Color3.new(0, 0, 0);
			--TextFits = props.TextFits;
			TextScaled = props.TextScaled;
			TextSize = props.TextSize or 26;
			TextStrokeColor3 = props.TextStrokeColor3 or Color3.new(0, 0, 0);
			TextStrokeTransparency = props.TextStrokeTransparency or 1;
			TextTransparency = props.TextTransparency or 0;
			TextTruncate = props.TextTruncate or Enum.TextTruncate.None;
			TextWrapped = props.TextWrapped;
			TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center;
			TextYAlignment = props.TextYAlignment or Enum.TextYAlignment.Center;

			-- GuiObject
			Active = false;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundTransparency = 1;
			BorderSizePixel = 0;
			Position = UDim2.new(0.5, shadowOffset.X or 0, 0.5, shadowOffset.Y or 0);
			Size = UDim2.new(1, 0, 1, 0);
			Visible = props.Shadow or props.Visible;
			ZIndex = props.ZIndex and props.ZIndex - 1 or 0;
		}, {
			TextConstraint = Roact.createElement("UITextSizeConstraint", {
				MinTextSize = props.MinTextSize or 1;
				MaxTextSize = props.MaxTextSize or 100;
			});
		})
	end
end