local QBCore = exports['qb-core']:GetCoreObject()

-- Buying a casino member item
RegisterNetEvent("casino:server:buyCasinoMember", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalCost = 5000 -- Set the price for a casino_member item

    -- Check if the player has enough money
    if Player.Functions.GetMoney("bank") >= totalCost then
        Player.Functions.RemoveMoney("bank", totalCost)
        Player.Functions.AddItem("casino_member", 1) -- Add one casino_member item
        TriggerClientEvent('QBCore:Notify', src, "You bought a Casino Membership", "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "Not enough money in your bank", "error")
    end
end)

-- Buying a casino VIP item
RegisterNetEvent("casino:server:buyCasinoVIP", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalCost = 50000 -- Set the price for a casino_vip item

    -- Check if the player has enough money
    if Player.Functions.GetMoney("bank") >= totalCost then
        Player.Functions.RemoveMoney("bank", totalCost)
        Player.Functions.AddItem("casino_vip", 1) -- Add one casino_vip item
        TriggerClientEvent('QBCore:Notify', src, "You bought a Casino VIP Membership", "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "Not enough money in your bank", "error")
    end
end)

-- You would also create a corresponding client.lua to interact with the NPC
