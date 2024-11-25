local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("casino:server:buyCasinoChip", function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalCost = amount

    -- Check if player has at least one 'casino_member' item
    local casinoMembership = Player.Functions.GetItemByName("casino_member")

    if casinoMembership and casinoMembership.amount > 0 then
        if Player.Functions.GetMoney("bank") >= totalCost then
            Player.Functions.RemoveMoney("bank", totalCost)
            Player.Functions.AddItem("casino_chip", amount)
            TriggerClientEvent('QBCore:Notify', src, "You bought " .. amount .. " Casino Chips", "success")
        else
            TriggerClientEvent('QBCore:Notify', src, "Not enough money in your bank", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You need a casino membership to buy Casino Chips", "error")
    end
end)

RegisterNetEvent("casino:server:sellCasinoChip", function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("casino_chip")

    if item and item.amount >= amount then
        Player.Functions.RemoveItem("casino_chip", amount)
        Player.Functions.AddMoney("bank", amount)
        TriggerClientEvent('QBCore:Notify', src, "You exchanged " .. amount .. " Casino Chips", "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "You don't have enough Casino Chips to exchange", "error")
    end
end)
