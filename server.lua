AddEventHandler('NoNPC:InvokeEnable', function()
	TriggerClientEvent('NoNPC:Enable', -1)
end)

AddEventHandler('NoNPC:InvokeDisable', function()
	TriggerClientEvent('NoNPC:Disable', -1)
end)

RegisterServerEvent('NoNPC:InvokeEnable')
RegisterServerEvent('NoNPC:InvokeDisable')
