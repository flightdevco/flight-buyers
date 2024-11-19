local SHOPS = {}

local CORE

if Config.Framework == "qb" then
    CORE = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "esx" then
    CORE = exports["es_extended"]:getSharedObject()
end

local function Inventory(data)
    if Config.Inventory == "ox" then
        if data.action == "has" then
            if not exports.ox_inventory:GetItem(data.src, data.item, nil, true) then return false end
            return exports.ox_inventory:GetItemCount(data.src, data.item, nil, true) > data.quantity
        elseif data.action == "add" then
            exports.ox_inventory:AddItem(data.src, data.item, data.amount or 1)
        elseif data.action == "remove" then
            exports.ox_inventory:RemoveItem(data.src, data.item, data.amount or 1)
        end
    elseif Config.Inventory == "qb" then
        local player = CORE.Functions.GetPlayer(data.src)
        if data.action == "has" then
            local item = player.Functions.GetItemByName(data.item)
            return item and item.amount > data.quantity
        elseif data.action == "add" then
            player.Functions.AddItem(data.item, data.amount or 1, data.info)
        elseif data.action == "remove" then
            player.Functions.RemoveItem(data.item, data.amount or 1)
        end
    elseif Config.Inventory == "esx" then
        if data.action == "has" then
            return CORE.GetPlayerFromId(data.src).hasItem(data.item) ~= nil
        elseif data.action == "add" then
            CORE.GetPlayerFromId(data.src).addInventoryItem(data.item, data.amount)
        elseif data.action == "remove" then
            CORE.GetPlayerFromId(data.src).removeInventoryItem(data.item, data.amount)
        end
    end
end

local function AddMoney(src, type, amount)
    if Config.Framework == "qb" then
        CORE.Functions.GetPlayer(src).Functions.AddMoney(type or "cash", amount)
    elseif Config.Framework == "qbx" then
        local xPlayer = exports.qbx_core:GetPlayer(src)
        if type == "cash" then
            xPlayer.Functions.AddMoney(amount)
        else
            xPlayer.Functions.AddMoney(type, amount)
        end
    elseif Config.Framework == "esx" then
        local xPlayer = CORE.GetPlayerFromId(src)
        if type == "cash" then
            xPlayer.addMoney(amount)
        else
            xPlayer.addAccountMoney(type, amount)
        end
    end
end
RegisterNetEvent('flight-buyers:server:Sell', function(data, quantity)
    while not source do Wait(10) end
    local src = source
    local itemExists = false
    for k, v in pairs(Config.Shops[data.buyerId].Items) do
        if v.name == data.item then
            itemExists = true
            if v.price ~= data.price then
                TriggerClientEvent('ox_lib:notify', src,
                    {
                        title = "Buyers",
                        description = "Price mismatch, please try again.",
                        type = "error"
                    })
                return
            end
            break
        end
    end
    if not itemExists then
        TriggerClientEvent('ox_lib:notify', src,
            {
                title = "Buyers",
                description = "Nice Try, please teach me how you did it",
                type = "error"
            })
        return
    end
    if SHOPS[data.location] and SHOPS[data.location][data.item] and SHOPS[data.location][data.item].limit then
        local soldCount = SHOPS[data.location][data.item].soldCount
        if data.limit.limit <= (soldCount + quantity) and (soldCount + quantity) >= quantity then
            TriggerClientEvent('ox_lib:notify', src,
                {
                    title = "Buyers",
                    description = "No longer accepting sales today bugger off.",
                    type =
                    "error"
                })
            return
        end
    end
    if not Inventory({ src = src, item = data.item, action = "has", quantity = quantity }) then
        TriggerClientEvent('ox_lib:notify', src,
            { title = "Buyers", description = "You don't have enough quantity", type = "error" })
        return
    end
    local price = data.price * quantity
    Inventory({ src = src, item = data.item, quantity = quantity, action = "remove" })
    AddMoney(src, "cash", price)
    if Config.Shops[data.buyerId].Dispatch.toggle and math.random(1, 100) <= Config.Shops[data.buyerId].Dispatch.chance then
        TriggerClientEvent("flight-buyers:client:Dispatch", src)
    end
    TriggerClientEvent('ox_lib:notify', src, { title = "Buyers", description = "Confirmed", type = "success" })
    if not SHOPS[data.location] then
        SHOPS[data.location] = {}
        SHOPS[data.location][data.item] = {}
        SHOPS[data.location][data.item] = { soldCount = quantity, limit = data.limit.toggle }
    else
        if SHOPS[data.location][data.item] and SHOPS[data.location][data.item].soldCount then
            SHOPS[data.location][data.item].soldCount += quantity
        end
    end
end)

local locations = {}

lib.callback.register('flight-buyers:callback:randomLocation', function(source, k)
    if not locations[k] then
        locations[k] = math.random(1, #Config.Shops[k].Locations)
    end
    return locations[k]
end)
