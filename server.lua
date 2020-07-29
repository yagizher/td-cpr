ESX               = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('td-cpr:isplayerdead', function(source, cb, target)
    local player = ESX.GetPlayerFromId(target)
    MySQL.Async.fetchAll('SELECT is_dead FROM users WHERE identifier = @identifier', {
        ['@identifier'] = player.identifier
    }, function(results)
        cb(results[1].is_dead)
    end)
end)