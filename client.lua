-- teamDemo --
local PlayerData = {}
ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterCommand('cpr', function(data, ped)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            local closestPlayerPed = GetPlayerPed(closestPlayer)
            ESX.TriggerServerCallback('td-cpr:isplayerdead', function(isPedDead)
                if isPedDead then
                    local playerPed = PlayerPedId()

                    ESX.ShowNotification('Müdahale devam ediyor.')

                    local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'

                    for i = 1, 15, 1 do
                        Citizen.Wait(900)

                        ESX.Streaming.RequestAnimDict(lib, function()
                            TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                        end)
                    end
                    luckyatsizatabeg()
                    
                else
                    ESX.ShowNotification('Kişi zaten bilinçli!')
                end

            end, GetPlayerServerId(closestPlayer))
end)

function luckyatsizatabeg()

    local pos = GetEntityCoords(PlayerPedId())
    local myluck = math.random(5)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    if myluck == 1 then
        exports['mythic_notify']:SendAlert('error', 'Başarısız oldun', 2500) 
    elseif myluck == 2 then
        TriggerServerEvent('disc-ambulancejob:revive', GetPlayerServerId(closestPlayer))        
    elseif myluck == 3 then
        exports['mythic_notify']:SendAlert('error', 'Başarısız oldun', 2500)
    elseif myluck == 4 then
        exports['mythic_notify']:SendAlert('error', 'Başarısız oldun', 2500)
    elseif myluck == 5 then
        exports['mythic_notify']:SendAlert('error', 'Başarısız oldun', 2500)
    end    
end
