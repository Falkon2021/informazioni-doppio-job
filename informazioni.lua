ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)



RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job)
    ESX.PlayerData.job2 = job2
end)

RegisterCommand('info', function()
    TriggerEvent('xMx_informazioni')
end)

RegisterNetEvent('xMx_informazioni')
AddEventHandler('xMx_informazioni', function()
    local elements = {
        {label = 'Id: '..GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))},
        {label = 'Lavoro principale: '..ESX.PlayerData.job.label},
        {label = 'Grado Lavoro principale: '..ESX.PlayerData.job.grade_label},

        {label = 'Lavoro criminale: '..ESX.PlayerData.job2.label},
        {label = 'Grado Lavoro criminale : '..ESX.PlayerData.job2.grade_label},
    }
    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'f5_informazioni',
    { 
    title = 'Informazioni', 
    align = 'left-top', 
    elements = elements 
    }, function(data, menu)
    if data.current.value ~= nil then
        menu.close()
    end
    end, function(data, menu) 
        menu.close() 
    end)
end)