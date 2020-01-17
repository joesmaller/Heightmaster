-- SoftBox
-- Joe (ITBV)
-- January 4, 2020

--[[

	Properties:

		[integer]	EdgeSize
		[color3]	Color
		[float]		Transparency
		[bool]		Fill

		[vector2]	AnchorPoint
		[udim2]		Position
		[udim2]		Size
		[integer]	ZIndex

]]

-- Constants
local DEFAULT_EDGESIZE = 1;
local DEFAULT_COLOR = Color3.new(1, 1, 1);
local DEFAULT_TRANSPARENCY = 0;
local DEFAULT_ANCHORPOINT = Vector2.new(0.5, 0.5);
local DEFAULT_POSITION = UDim2.new(0.5, 0, 0.5, 0);
local DEFAULT_SIZE = UDim2.new(1, 0, 1, 0);
local DEFAULT_ZINDEX = 1;
local ASSETS = {
	{
		Image = "rbxassetid://4574488470";
		ImageRectSize = Vector2.new(4, 4);
		SliceCenter = Rect.new(2, 2, 2, 2);
	};
	{
		Image = "rbxassetid://4574481604";
		ImageRectSize = Vector2.new(6, 6);
		SliceCenter = Rect.new(3, 3, 3, 3);
	};
	{
		Image = "rbxassetid://4574481604";
		ImageRectSize = Vector2.new(8, 8);
		SliceCenter = Rect.new(4, 4, 4, 4);
	}
}


return function(Roact)
	return function(props)
		local edgeSize = props.EdgeSize or DEFAULT_EDGESIZE

		return Roact.createElement("ImageLabel", {
			Image = ASSETS[edgeSize].Image;
			ImageRectSize = ASSETS[edgeSize].ImageRectSize;
			SliceCenter = ASSETS[edgeSize].SliceCenter;
			ScaleType = Enum.ScaleType.Slice;

			ImageColor3 = props.Color or DEFAULT_COLOR;
			ImageTransparency = props.Transparency or DEFAULT_TRANSPARENCY;

			-- GuiObject
			Active = props.Active;
			AnchorPoint = props.AnchorPoint or DEFAULT_ANCHORPOINT;
			BackgroundTransparency = 1;
			BorderSizePixel = 0;
			ClipsDescendants = props.ClipsDescendants;
			LayoutOrder = props.LayoutOrder or 0;
			NextSelectionDown = props.NextSelectionDown;
			NextSelectionLeft = props.NextSelectionLeft;
			NextSelectionRight = props.NextSelectionRight;
			NextSelectionUp = props.NextSelectionUp;
			Position = props.Position or DEFAULT_POSITION;
			Rotation = props.Roation or 0;
			Selectable = props.Selectable;
			SelectionImageObject = props.SelectionImageObject;
			Size = props.Size or DEFAULT_SIZE;
			SizeConstraint = props.SizeConstraint or Enum.SizeConstraint.RelativeXY;
			Visible = props.Visible;
			ZIndex = props.ZIndex or DEFAULT_ZINDEX;

			-- GuiObject
			[Roact.Event.InputBegan] = props.InputBegan;
			[Roact.Event.InputChanged] = props.InputChanged;
			[Roact.Event.InputEnded] = props.InputEnded;
			[Roact.Event.MouseEnter] = props.MouseEnter;
			[Roact.Event.MouseLeave] = props.MouseLeave;
			[Roact.Event.MouseMoved] = props.MouseMoved;
			[Roact.Event.MouseWheelBackward] = props.MouseWheelBackward;
			[Roact.Event.MouseWheelForward] = props.MouseWheelForward;
			[Roact.Event.SelectionGained] = props.SelectionGained;
			[Roact.Event.SelectionLost] = props.SelectionLost;
			[Roact.Event.TouchLongPress] = props.TouchLongPress;
			[Roact.Event.TouchPan] = props.TouchPan;
			[Roact.Event.TouchPinch] = props.TouchPinch;
			[Roact.Event.TouchRotate] = props.TouchRotate;
			[Roact.Event.TouchSwipe] = props.TouchSwipe;
			[Roact.Event.TouchTap] = props.TouchTap;

			-- Instance
			[Roact.Event.AncestryChanged] = props.AncestryChanged;
			[Roact.Event.AttributeChanged] = props.AttributeChanged;
			[Roact.Event.Changed] = props.Changed;
			[Roact.Event.ChildAdded] = props.ChildAdded;
			[Roact.Event.ChildRemoved] = props.ChildRemoved;
			[Roact.Event.DescendantAdded] = props.DescendantAdded;
			[Roact.Event.DescendantRemoving] = props.DescendantRemoving;
		}, {
			Container = Roact.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 1;
				BorderSizePixel = 0;
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = props.Fill and UDim2.new(1, -(edgeSize * 2), 1, -(edgeSize * 2))
				or not props.Fill and UDim2.new(1, 0, 1, 0);
			}, props[Roact.Children])
		})
	end
end