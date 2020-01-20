-- Plugin Button
-- Joe (ITBV)
-- January 18, 2020



-- Constants
local INTERACT_TIME = 0.1
local COLOR_BUTTON = Enum.StudioStyleGuideColor.Button
local COLOR_TEXT = Enum.StudioStyleGuideColor.MainText
local DEFAULT = Enum.StudioStyleGuideModifier.Default
local PRESSED = Enum.StudioStyleGuideModifier.Pressed
local HOVER = Enum.StudioStyleGuideModifier.Hover

-- Components
local SoftBox = require(script.Parent:WaitForChild("SoftBox"))
local TextButton = require(script.Parent:WaitForChild("TextButton"))


--// Code //--

return function(Roact)
	local PluginButton = Roact.PureComponent:extend("PluginButton")

	function PluginButton:update(modifier, hovering, lastInteracted)
		self:setState(function(state)
			local newState = {}
			for i,v in ipairs(state) do
				newState[i] = v
			end
			if (typeof(modifier) == "EnumItem") then
				newState.Color = settings().Studio.Theme:GetColor(COLOR_BUTTON, modifier)
				newState.TextColor = settings().Studio.Theme:GetColor(COLOR_TEXT, modifier)
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

	function PluginButton:init()
		self:update(DEFAULT, false, tick())
	end

	function PluginButton:render()
		local props = self.props
		local state = self.state

		return Roact.createElement(SoftBox(Roact), {
			Color = state.Color;

			AnchorPoint = props.AnchorPoint;
			Position = props.Position;
			Size = props.Size;

			MouseEnter = function(rbx)
				if (tick() - state.LastInteracted <= INTERACT_TIME or state.Hovering) then return end
				self:update(HOVER, true, tick())
			end;
			MouseLeave = function(rbx)
				self:update(DEFAULT, false)
			end
		}, {
			Button = Roact.createElement(TextButton(Roact), {
				Active = true;
				AutoButtonColor = false;

				Text = props.Text;
				TextColor3 = state.TextColor;
				TextWrapped = true;
				TextScaled = true;
				
				MinTextSize = props.MinTextSize;
				MaxTextSize = props.MaxTextSize;

				Shadow = false;
				
				MouseButton1Down = function(rbx)
					if (tick() - state.LastInteracted <= INTERACT_TIME) then return end
					self:update(PRESSED, nil, tick())
				end;
				MouseButton1Up = function(rbx)
					if (state.Hovering) then
						self:update(HOVER)
					else
						self:update(DEFAULT)
					end
					props.Activated()
				end;
			})
		})
	end

	return PluginButton
end