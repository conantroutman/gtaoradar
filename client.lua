Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustReleased(0, 20) then -- 20 is z
			Citizen.Wait(25)
			if not isRadarExtended then
				extendRadar()
			elseif isRadarExtended	then
				minimizeRadar()
			end
		end
	end
end)

function extendRadar()
	SetRadarBigmapEnabled(true, false)
	LastGameTimer = GetGameTimer()
	isRadarExtended = true

	Citizen.SetTimeout(10000, function()
		if isRadarExtended then
			minimizeRadar()
		end
	  end)
end

function minimizeRadar()
	SetRadarBigmapEnabled(false, false)
	LastGameTimer = 0
	isRadarExtended = false
end