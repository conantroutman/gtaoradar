local isRadarExtended = false
local timer = 0

Citizen.CreateThread(function()
	SetRadarBigmapEnabled(false, false)
	while true do
		Citizen.Wait(1)
		if IsControlJustReleased(0, 20) then -- 20 is z
			Citizen.Wait(25)
			if not isRadarExtended then
				ExtendRadar()
			elseif isRadarExtended	then
				MinimizeRadar()
			end
		end

		if isRadarExtended and timer == 0 then
			MinimizeRadar()
		end
	end
end)

function ExtendRadar()
	StartTimer(10)
	SetRadarBigmapEnabled(true, false)
	isRadarExtended = true
end

function MinimizeRadar()
	timer = 0
	SetRadarBigmapEnabled(false, false)
	isRadarExtended = false
end

function StartTimer(time)
	timer = time
	Citizen.CreateThread(function()
		while isRadarExtended do
			Citizen.Wait(1000)
			timer = timer-1
		end
	end)
end