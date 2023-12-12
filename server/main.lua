ESX = {}
ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('citizen_rental:pay')

AddEventHandler('citizen_rental:pay', function(playerId, name, model, price, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer and xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)

        TriggerClientEvent('citizen_rental:paymentSuccessful', _source, model)
    else
        TriggerClientEvent('esx:showNotification', source, Lang[Config.Locale].NotEnoughMoneyText, 'error')
    end
end)
