-- Initialize QBCore
local QBCore = exports['qb-core']:GetCoreObject()

-- Check if player has VIP item
QBCore.Functions.CreateCallback('casino:checkVIPStatus', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local vipItem = Player.Functions.GetItemByName("casino_vip")
        if vipItem then
            cb(true) -- Player has the casino_vip item
        else
            cb(false) -- Player does not have the item
        end
    else
        cb(false)
    end
end)
