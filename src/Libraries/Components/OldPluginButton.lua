-- Plugin Button
-- Joe (ITBV)
-- January 9, 2020



-- Constants
local HOVER_TIME = 0.1
local GUIDE_COLOR = Enum.StudioStyleGuideColor.Button
local GUIDE_DEFAULT = Enum.StudioStyleGuideModifier.Default
local GUIDE_SELECTED = Enum.StudioStyleGuideModifier.Selected
local GUIDE_PRESSED = Enum.StudioStyleGuideModifier.Pressed
local GUIDE_DISABLED = Enum.StudioStyleGuideModifier.Disabled
local GUIDE_HOVER = Enum.StudioStyleGuideModifier.Hover

-- Variables
local lastUsed = tick()

local SoftBox = require(script.Parent:WaitForChild("SoftBox"))
local TextButton = require(script.Parent:WaitForChild("TextButton"))

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
	local PluginButton = Roact.PureComponent:extend("OldPluginButton")

	function PluginButton:init()
		self:setState(function(state)
			return {
				Hovering = false;
				Color = settings().Studio.Theme:GetColor(self.props.Guide or GUIDE_COLOR, GUIDE_DEFAULT);
			}
		end)
	end

	function PluginButton:setHovering(bool)
		self:setState(function(state)
			local newState = {}
			for i,v in pairs(state) do
				newState[i] = v
			end
			newState.Hovering = bool;
			return newState
		end)
	end

	function PluginButton:setColor(color)
		self:setState(function(state)
			local newState = {}
			for i,v in pairs(state) do
				newState[i] = v
			end
			newState.Color = settings().Studio.Theme:GetColor(self.props.Guide or GUIDE_COLOR, color)
			return newState
		end)
	end

	function PluginButton:render()
		local props = self.props

		local leaveEvent = function()
			self:setHovering(false)
			self:setColor(GUIDE_DEFAULT)
		end
		local enterEvent = function()
			if (tick() - lastUsed <= HOVER_TIME) then return end
			lastUsed = tick()
			self:setHovering(true)
			self:setColor(GUIDE_HOVER)
		end

		return Roact.createElement(SoftBox(Roact), {
			Color = self.state.Color;

			AnchorPoint = props.Anchorpoint;
			Position = props.Position;
			Size = props.Size or UDim2.new(0, 100, 0, 50);

			MouseLeave = leaveEvent;
			MouseEnter = enterEvent;

		}, join(props[Roact.Children], {
			Button = Roact.createElement(TextButton(Roact), {
				AutoButtonColor = false;

				Text = props.Text;
				TextColor3 = props.TextColor3;

				Shadow = props.Shadow;
				ShadowOffset = props.ShadowOffset;

				MouseButton1Down = function(rbx)
					self:setColor(GUIDE_PRESSED)
				end;

				Activated = function(rbx)
					if (props.Activated) then
						props.Activated(rbx)
					end
				end;

				MouseButton1Up = function(rbx)
					if (self.state.Hovering) then
						self:setColor(GUIDE_HOVER)
					else
						self:setColor(GUIDE_DEFAULT)
					end
				end;
			})
		}))
	end

	return PluginButton
end