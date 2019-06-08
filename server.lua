AddEventHandler('NoNPC:InvokeEnable', function()
	if IsPlayerAceAllowed(source, 'NoNPC.Toggle') then
		TriggerClientEvent('NoNPC:Enable', -1)
	end
end)

AddEventHandler('NoNPC:InvokeDisable', function()
	if IsPlayerAceAllowed(source, 'NoNPC.Toggle') then
		TriggerClientEvent('NoNPC:Disable', -1)
	end
end)

RegisterServerEvent('NoNPC:InvokeEnable')
RegisterServerEvent('NoNPC:InvokeDisable')
