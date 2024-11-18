local function CreateBlip(coords, blipData)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, blipData.sprite)
    SetBlipColour(blip, blipData.color)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.label)
    EndTextCommandSetBlipName(blip)
end

local function Dispatch()
    exports['ps-dispatch']:SuspiciousActivity()
end

RegisterNetEvent("flight-buyers:client:Dispatch", Dispatch)

local function createTarget(ped, v, location, buyerId)
    if Config.Target == "ox" then
        exports.ox_target:addLocalEntity(ped, {
            label = v.name,
            type = "ped",
            icon = "fas fa-dollar-sign",
            distance = 4.0,
            onSelect = function()
                if GetClockHours() >= v.Locations[location].availableTime.open and GetClockHours() <= v.Locations[location].availableTime.close then
                    TriggerEvent("flight-buyers:client:Initiate", v, location, buyerId)
                    return
                end
                lib.notify({ title = "Flight Buyers", type = "error", description = "Closed, Come back later" })
            end
        })
    elseif Config.Target == "qb" then
        exports['qb-target']:AddTargetEntity(ped, {
            options = { {
                type = "client",
                label = v.name,
                targeticon = "fas fa-dollar-sign",
                action = function()
                    if GetClockHours() >= v.Locations[location].availableTime.open and GetClockHours() <= v.Locations[location].availableTime.close then
                        TriggerEvent("flight-buyers:client:Initiate", v, location, buyerId)
                        return
                    end
                    lib.notify({ title = "Flight Buyers", type = "error", description = "Closed, Come back later" })
                end
            }}
        })
    end
end

local location = nil

CreateThread(function()
    for k, v in pairs(Config.Shops) do
        if Config.Shops[k].RandomLocation and location == nil then
            location = lib.callback.await("flight-buyers:callback:randomLocation", false, k)
            if v.Blip.toggle then CreateBlip(v.Locations[location].coords, v.Blip) end
        end
        if location ~= nil then
            while not HasModelLoaded(GetHashKey(v.Ped.model)) do
                RequestModel(GetHashKey(v.Ped.model))
                Wait(10)
            end
            local ped = CreatePed(4, GetHashKey(v.Ped.model), v.Locations[location].coords, v.Locations[location]
            .heading, false, false)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            TaskStartScenarioInPlace(ped, v.Ped.scenarion, 0, true)
            createTarget(ped, v, location, k)
            location = nil
        else
            for m, n in pairs(v.Locations) do
                if v.Blip.toggle then CreateBlip(n.coords, v.Blip) end
                while not HasModelLoaded(GetHashKey(v.Ped.model)) do
                    RequestModel(GetHashKey(v.Ped.model))
                    Wait(10)
                end
                local ped = CreatePed(4, GetHashKey(v.Ped.model), n.coords, n.heading, false, false)
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true)
                SetBlockingOfNonTemporaryEvents(ped, true)
                TaskStartScenarioInPlace(ped, v.Ped.scenarion, 0, true)
                createTarget(ped, v, m)
            end
            location = nil
        end
    end
end)

RegisterNetEvent("flight-buyers:client:Initiate", function(data, selectedLocation, buyerId)
    local items = {}
    for k, v in pairs(data.Items) do
        items[k] = {
            icon = "fas fa-dollar-sign",
            title = v.label,
            event = "flight-buyers:client:Input",
            description = "Sell" .." " .. v.label .. " " .. " for" .. " ".. v.price .. "$",
            args = {
                item = v.item,
                label = v.label,
                price = v.price,
                limit = v.Limit,
                location = selectedLocation,
                shop = data.name,
                name = data.name,
                buyerId = buyerId,
            },
        }
    end

    lib.registerContext({
        title = data.name,
        id = data.name,
        canClose = true,
        options = items,
    })

    lib.showContext(data.name)
end)

RegisterNetEvent("flight-buyers:client:Input", function(args)
    lib.hideContext()
    local input = lib.inputDialog("Selling Quatity",
        {{ type = 'slider', label = 'Select Quantity', description = "Sell" .. " " .. args.label, required = true, min = 1, max =
        args.limit.toggle and args.limit.limit or 20 }})
    if not input then
        lib.showContext(args.name)
        return
    end
    TriggerServerEvent("flight-buyers:server:Sell", args, input[1])
end)
