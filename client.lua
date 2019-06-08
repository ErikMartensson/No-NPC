local npcsDisabled = false

AddEventHandler('NoNPC:Enable', function()
	print('NoNPC:Enable')
	npcsDisabled = false

	TriggerEvent('chat:addMessage', {
		color = { 0, 255, 80},
		args = { 'NPCs enabled' },
	})
end)
AddEventHandler('NoNPC:Disable', function()
	print('NoNPC:Disable')
	npcsDisabled = true

	TriggerEvent('chat:addMessage', {
		color = { 255, 0, 80},
		args = { 'NPCs disabled' },
	})

	-- Clear everything in a near radius
	local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
	-- _CLEAR_AREA_OF_EVERYTHING
	Citizen.InvokeNative(0x20E4FFD9, x, y, z, 1000.0, false, false, false, false)
	ClearAreaOfVehicles(x, y, z, 1000.0, false, false, false, false, false)
	ClearAreaOfPeds(x, y, z, 1000.0, 1)
end)
RegisterNetEvent('NoNPC:Enable')
RegisterNetEvent('NoNPC:Disable')

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

		if IsControlJustReleased(0, 84) then
			if (npcsDisabled) then
				TriggerServerEvent('NoNPC:InvokeEnable')
			else
				TriggerServerEvent('NoNPC:InvokeDisable')
			end
		end

		if (npcsDisabled) then
			-- These natives have to be called every frame.
			SetVehicleDensityMultiplierThisFrame(0.0) -- set traffic density to 0
			SetPedDensityMultiplierThisFrame(0.0) -- set npc/ai peds density to 0
			SetRandomVehicleDensityMultiplierThisFrame(0.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
			SetParkedVehicleDensityMultiplierThisFrame(0.0) -- set random parked vehicles (parked car scenarios) to 0
			SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- set random npc/ai peds or scenario peds to 0
			SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
			SetRandomBoats(false) -- Stop random boats from spawning in the water.
			SetCreateRandomCops(false) -- disable random cops walking/driving around.
			SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
			SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.

			local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
			ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
			RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
		end
	end
end)

