local QBCore = exports['qb-core']:GetCoreObject()

local popupIsOpen = false

local function showPopup(header, text) 
    QBCore.Functions.Notify("Press ESC to close")
    SendNUIMessage({
        action = "cwPopup",
        header = header,
        text = text,
        toggle = true,
    })
    popupIsOpen = true
    SetNuiFocus(true, true)
end exports('showPopup', showPopup)

local function closePopup(header, text) 
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "cwPopup",
        header = header,
        text = text,
        toggle = false,
    })
    popupIsOpen = false
end exports('closePopup', closePopup)

RegisterNetEvent("cw-popup:client:openPopup", function(header, text)
    showPopup(header,text)
end)

RegisterNUICallback("escape", function()
    TriggerEvent('animations:client:EmoteCommandStart', {'c'})
    SetNuiFocus(false)
    popupIsOpen = false
end)