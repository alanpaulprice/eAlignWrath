SLASH_EA1 = "/align"

local frame

SlashCmdList["EA"] = function()
	-- If the frame exists:
	if frame then
		-- Hide it, then discard it.
		frame:Hide()
		frame = nil
	-- If the frame doesn't exist:
	else
		-- Create the frame.
		frame = CreateFrame('Frame', nil, UIParent) 
		frame:SetAllPoints(UIParent)

		-- These values will used to space the lines evenly.
		local w = GetScreenWidth() / 64
		local h = GetScreenHeight() / 36

		-- Create the horizontal lines.
		for i = 0, 64 do
			local texture = frame:CreateTexture(nil, 'LINE')

			-- Give the middle a line different color and opacity.
			if i == 32 then
				texture:SetTexture(1, 1, 1, 0.5)
			else
				texture:SetTexture(1, 1, 1, 0.15)
			end

			-- Position the line.
			texture:SetPoint('TOPLEFT', frame, 'TOPLEFT', i * w - 1, 0)
			texture:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMLEFT', i * w + 1, 0)
		end

		-- Create the vertical lines.
		for i = 0, 36 do
			local t = frame:CreateTexture(nil, 'LINE')

			-- Give the middle a line different color and opacity.
			if i == 18 then
				t:SetTexture(1, 1, 1, 0.5)
			else
				t:SetTexture(1, 1, 1, 0.15)
			end

			-- Position the line.
			t:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, -i * h + 1)
			t:SetPoint('BOTTOMRIGHT', frame, 'TOPRIGHT', 0, -i * h - 1)
		end	
	end
end