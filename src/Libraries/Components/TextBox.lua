-- Text Box
-- Joe (ITBV)
-- January 9, 2020


local TextShadow = require(script.Parent:WaitForChild("TextShadow"))

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
	local TextBox = Roact.PureComponent:extend("TextBox")


	function TextBox:setText(text)
		assert(type(text) == "string", "Argument #1 (text) must be a string")
		self:setState(function(state)
			return {
				Text = text
			}
		end)
	end

	function TextBox:init()
		self:setText(tostring(self.props.Text) or "")
	end

	function TextBox:render()
		local props = self.props
		local state = self.state

		return Roact.createElement("Frame", {
			--// Properties

			-- GuiObject
			Active = props.Active;
			AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5);
			BackgroundColor3 = props.BackgroundColor3 or Color3.new(0.5, 0.5, 0.5);
			BackgroundTransparency = props.BackgroundTransparency or 1;
			BorderColor3 = props.BorderColor3 or Color3.new(0.1, 0.1, 0.1);
			BorderMode = props.BorderMode or Enum.BorderMode.Outline;
			BorderSizePixel = props.BorderSizePixel or 0;
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

			-- GuiBase2d
			AutoLocalize = props.AutoLocalize;
			RootLocalizationTable = props.RootLocalizationTable;

			-- Instance
			Archivable = props.Archivable;
		}, {
			TextBox = Roact.createElement("TextBox", {
				--// Properties
	
				-- Textbox
				ClearTextOnFocus = props.ClearTextOnFocus;
				CursorPosition = props.CursorPosition or 1;
				Font = props.Font or Enum.Font.Gotham;
				LineHeight = props.LineHeight or 1;
				MultiLine = props.MultiLine;
				PlaceholderColor3 = props.PlaceholderColor3 or Color3.new(0.5, 0.5, 0.5);
				PlaceholderText = props.PlaceholderText or "";
				SelectionStart = props.SelectionStart or -1;
				ShowNativeInput = props.ShowNativeInput;
				Text = state.Text;
				--TextBounds = props.TextBounds or Vector2.new(0, 0);
				TextColor3 = props.TextColor3 or Color3.new(1, 1, 1);
				TextEditable = props.TextEditable;
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
				Active = props.Active;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 1;
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = props.ZIndex or 1;
	
				-- GuiBase2d
				AutoLocalize = props.AutoLocalize;
				RootLocalizationTable = props.RootLocalizationTable;
	
				-- Instance
				Archivable = props.Archivable;
	
	
				--// Events
	
				-- TextBox
				[Roact.Event.FocusLost] = props.FocusLost;
				[Roact.Event.Focused] = props.Focused;
				[Roact.Event.ReturnPressedFromOnScreenKeyboard] = props.ReturnPressedFromOnScreenKeyboard;
				[Roact.Change.Text] = function(rbx)
					local text = props.TextChanged(rbx)
					if (text) then
						rbx.Text = text
					end
					self:setText((type(text) == "string") and text or rbx.Text)
				end;
	
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
				TextConstraint = Roact.createElement("UITextSizeConstraint", {
					MinTextSize = props.MinTextSize or 1;
					MaxTextSize = props.MaxTextSize or 100;
				});
			});
			Shadow = Roact.createElement(TextShadow(Roact), {
				-- TextLabel
				Font = props.Font or Enum.Font.Gotham;
				LineHeight = props.LineHeight;
				Text = state.Text;
				TextColor3 = props.ShadowColor;
				TextScaled = props.TextScaled;
				TextSize = props.TextSize;
				TextStrokeColor3 = props.TextStrokeColor3;
				TextStrokeTransparency = props.TextStrokeTransparency;
				TextTransparency = props.TextTransparency;
				TextTruncate = props.TextTruncate;
				TextWrapped = props.TextWrapped;
				TextXAlignment = props.TextXAlignment;
				TextYAlignment = props.TextYAlignment;

				-- GuiObject
				Visible = props.Shadow;
				ZIndex = props.ZIndex and props.ZIndex - 1 or 0;

				-- TextConstraint
				MinTextSize = props.MinTextSize;
				MaxTextSize = props.MaxTextSize;
			});
		})
	end

	return TextBox
end