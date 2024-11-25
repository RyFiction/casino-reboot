local QBCore = exports['qb-core']:GetCoreObject()

local quantity = 0
local ItemList = {
    ["casino_chip"] = 1,
}

RegisterNetEvent("ry::server:purchaseMembership", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MembershipCheck = Player.Functions.GetItemByName('casino_members')
    if MembershipCheck ~= nil then
        TriggerClientEvent('ry::casinoMembershipMenu', src)
        TriggerClientEvent('QBCore:Notify', src, 'You already have a Membership', 'error')
    else
	    if Player.Functions.AddItem('casino_members', 1, false, info) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['casino_members'], "add", 1)
            TriggerClientEvent('ry::casinoMembershipMenu', src)

        end
    end
end)

RegisterNetEvent("ry::server:purchaseVIPMembership", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local VIPMembershipCheck = Player.Functions.GetItemByName('casino_vip')
    if VIPMembershipCheck ~= nil then
        TriggerClientEvent('ry::casinoMembershipMenu', src)
        TriggerClientEvent('QBCore:Notify', src, 'You already have a Membership', 'error')
    else
	    if Player.Functions.AddItem('casino_vip', 1, false, info) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['casino_vip'], "add", 1)
            TriggerClientEvent('ry::casinoMembershipMenu', src)

        end
    end 
end)


QBCore.Functions.CreateCallback('ry::server:HasCasinoMembership', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("casino_members")

    if Item ~= nil then 
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('ry::server:HasVIPMembership', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("casino_vip")

    if Item ~= nil then 
        cb(true)
    else
        cb(false)
    end
end)

















