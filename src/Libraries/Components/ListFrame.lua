-- List Frame
-- Joe (ITBV)
-- January 5, 2020



-- Constants
local DEFAULT_BOTTOM_IMAGE = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
local DEFAULT_MID_IMADE = "rbxasset://textures/ui/Scroll/scroll-middle.png"
local DEFAULT_TOP_IMAGE = "rbxasset://textures/ui/Scroll/scroll-top.png"
local DEFAULT_SCROLLBAR_COLOR = Color3.new(0.75, 0.75, 0.75)
local DEFAULT_SCROLLBAR_TRANSPARENCY = 0.5
local DEFAULT_SCROLLBAR_THICKNESS = 12


--// Code //--

local function join(original, children)
	local newTable = {}
	if (original) then
		for i,v in pairs(original) do
			newTable[i] = v
		end
	end
	if (children) then
		for i,v in pairs(children) do
			newTable[i] = v
		end
	end
	return newTable
end

return function(Roact)
	local ListFrame = Roact.PureComponent:extend("ListFrame")

	function ListFrame:init()
		self:setState(function(state)
			return {
				CanvasSize = UDim2.new(0, 0, 0, 0);
			}
		end)
	end

	function ListFrame:_setCanvasSize(contentSize)
		self:setState(function(state)
			return {
				CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y)
			}
		end)
	end

	function ListFrame:render()
		local props = self.props

		return Roact.createElement("ScrollingFrame", {
			--// Properties

			-- ScrollingFrame
			BottomImage = props.BottomImage or DEFAULT_BOTTOM_IMAGE;
			CanvasPosition = props.CanvasPosition or Vector2.new(0, 0);
			CanvasSize = self.state.CanvasSize;
			ElasticBehavior = props.ElasticBehavior or Enum.ElasticBehavior.WhenScrollable;
			HorizontalScrollBarInset = props.HorizontalScrollBarInset or Enum.ScrollBarInset.None;
			MidImage = props.MidImage or DEFAULT_MID_IMADE;
			ScrollBarImageColor3 = props.ScrollBarImageColor3 or DEFAULT_SCROLLBAR_COLOR;
			ScrollBarImageTransparency = props.ScrollBarImageTransparency or DEFAULT_SCROLLBAR_TRANSPARENCY;
			ScrollBarThickness = props.ScrollBarThickness or DEFAULT_SCROLLBAR_THICKNESS;
			ScrollingDirection = props.ScrollingDirection or Enum.ScrollingDirection.XY;
			ScrollingEnabled = props.ScrollingEnabled;
			TopImage = props.TopImage or DEFAULT_TOP_IMAGE;
			VerticalScrollBarInset = props.VerticalScrollBarInset or Enum.ScrollBarInset.None;
			VerticalScrollBarPosition = props.VerticalScrollBarPosition.Right;

			-- GuiObject
			Active = props.Active;
			AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5);
			BackgroundTransparency = 1;
			--BorderMode = props.BorderMode or Enum.BorderMode.Outline;
			BorderSizePixel = 0;
			ClipsDescendants = props.ClipsDescendants;
			LayoutOrder = props.LayoutOrder or 0;
			NextSelectionDown = props.NextSelectionDown;
			NextSelectionLeft = props.NextSelectionLeft;
			NextSelectionRight = props.NextSelectionRight;
			NextSelectionUp = props.NextSelectionUp;
			Position = props.Position or UDim2.new(0.5, 0, 0.5, 0);
			Rotation = props.Roation or 0;
			Selectable = props.Selectable;
			SelectionImageObject = props.SelectionImageObject;
			Size = props.Size or UDim2.new(1, 0, 1, 0);
			SizeConstraint = props.SizeConstraint or Enum.SizeConstraint.RelativeXY;
			Visible = props.Visible;
			ZIndex = props.ZIndex or 1;
		}, join(props[Roact.Children], {
			GridFrame = Roact.createElement("UIListLayout", {
				-- UIListLayout
				Padding = props.CellPadding or UDim.new(0, 0);

				-- UIGridStyleLayout
				-- AbsoluteContentSize = props.AbsoluteContentSize;
				FillDirection = props.FillDirection or Enum.FillDirection.Horizontal;
				HorizontalAlignment = props.HorizontalAlignment or Enum.HorizontalAlignment.Left;
				SortOrder = props.SortOrder or Enum.SortOrder.LayoutOrder;
				VerticalAlignment = props.VerticalAlignment or Enum.VerticalAlignment.Top;

				[Roact.Change.AbsoluteContentSize] = function(rbx)
					self:_setCanvasSize(rbx.AbsoluteContentSize)
				end;
			});
		}))
	end

	return ListFrame
end