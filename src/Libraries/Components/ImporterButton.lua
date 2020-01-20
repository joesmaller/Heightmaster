-- Importer Button
-- Joe (ITBV)
-- January 18, 2020



-- Constants
local SIZE_OFFSET = -10
local INTERACT_TIME = 0.1
local COLOR = Enum.StudioStyleGuideColor.Button
local DEFAULT = Enum.StudioStyleGuideModifier.Default
local HOVER = Enum.StudioStyleGuideModifier.Hover


--// Code //--

return function(Roact)
	local ImporterButton = Roact.PureComponent:extend("ImporterButton")

	function ImporterButton:init()
		self:update(DEFAULT, false, tick())
	end

	function ImporterButton:update(modifier, hovering, lastInteracted)
		self:setState(function(state)
			local newState = {}
			for i,v in ipairs(state) do
				newState[i] = v
			end
			if (typeof(modifier) == "EnumItem") then
				newState.Color = settings().Studio.Theme:GetColor(COLOR, modifier)
			end
			if (type(hovering) == "boolean") then
				newState.Hovering = hovering
			end
			if (type(lastInteracted) == "number") then
				newState.LastInteracted = lastInteracted
			end
			return newState
		end)
	end

	function ImporterButton:render()
		local props = self.props
		local state = self.state

		return Roact.createElement("ImageButton", {
			AutoButtonColor = false;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = state.Color;
			BorderSizePixel = 0;
			ClipsDescendants = true;
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, SIZE_OFFSET, 1, SIZE_OFFSET);
			ZIndex = props.ZIndex or 1;

			Image = props.Image or "";

			[Roact.Event.Activated] = props.Activated;

			[Roact.Event.MouseEnter] = function(rbx)
				if (tick() - self.state.LastInteracted <= INTERACT_TIME and not self.state.Hovering) then return end
				self:update(HOVER, true, tick())
			end;
			[Roact.Event.MouseLeave] = function(rbx)
				self:update(DEFAULT, false, tick())
			end;
		})
	end

	return ImporterButton
end