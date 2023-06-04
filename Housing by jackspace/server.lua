ESX = nil

local playerHouses = {}
local availableMLOs = {
    {name = "MLO1", price = 1000},
    {name = "MLO2", price = 2000},
    {name = "MLO3", price = 3000}
}

function GenerateHouseKey()
    -- Code zum Generieren eines eindeutigen Schlüssels, z. B. eine zufällige Zeichenkette
    return houseKey
end

function AssignHouseKey(playerId)
    local houseKey = GenerateHouseKey()
    -- Code zum Speichern des Schlüssels in der Datenbank für den Spieler mit der playerId
    return houseKey
end

function CreateHouse(playerId)
    local house = {}
    house.owner = playerId
    house.furniture = {}
    house.position = vector3(0, 0, 0)
    house.renovated = false
    house.wallColor = {r = 255, g = 255, b = 255}
    house.selectedMLO = nil
    house.houseKey = AssignHouseKey(playerId)
    house.isBeingRobbed = false

    playerHouses[playerId] = house
end

function AddFurniture(playerId, furniture)
    local house = playerHouses[playerId]
    if house and house.renovated then
        table.insert(house.furniture, furniture)
    end
end

function PlaceFurniture(playerId, furniture)
    local house = playerHouses[playerId]
    if house and house.renovated then
        if --[Code zum Überprüfen des Möbelstücks im Inventar] then
            -- Code zum Platzieren des Möbelstücks im Spiel
            -- Code zum Entfernen des Möbelstücks aus dem Inventar
        else
            -- Code zur Anzeige einer Benachrichtigung, dass der Spieler das Möbelstück nicht besitzt
        end
    end
end

function RenovateHouse(playerId, wallColor)
    local house = playerHouses[playerId]
    if house then
        if not house.renovated then
            -- Code zum Überprüfen des Spielerinventars auf die erforderlichen Materialien

            if --[Code zum Überprüfen der Materialien im Inventar] then
                -- Code zum Entfernen der Materialien aus dem Inventar
                house.renovated = true
                house.wallColor = wallColor
            else
                -- Code zur Anzeige einer Benachrichtigung, dass der Spieler nicht über ausreichend Materialien verfügt
            end
        else
            -- Code zur Anzeige einer Benachrichtigung, dass das Haus bereits renoviert wurde
        end
    end
end

function BuyMLO(playerId, mloName)
    local house = playerHouses[playerId]
    if house and not house.renovated then
        local mlo = GetMLOByName(mloName)
        if mlo and not house.selectedMLO then
            -- Code zum Überprüfen des Spielergeldes und zum Abziehen des MLO-Preises
            house.selectedMLO = mloName
        else
            -- Code zur Anzeige einer Benachrichtigung, dass das MLO nicht verfügbar oder bereits ausgewählt wurde
        end
    end
end

function StealHouseKey(playerId)
    local house = playerHouses[playerId]
    if house then
        local targetPlayerId = -- Code zum Ermitteln der Ziel-Spieler-ID, von dem der Schlüssel gestohlen werden soll
        local targetHouse = playerHouses[targetPlayerId]
        if targetHouse and targetHouse.houseKey then
            -- Code zum Stehlen des Schlüssels und zum Speichern in der Datenbank des Spielers mit der playerId
        else
            -- Code zur Anzeige einer Benachrichtigung, dass der Ziel-Spieler keinen Schlüssel hat
        end
    end
end

function StartHouseRobbery(playerId)
    local house = playerHouses[playerId]
    if house and house.renovated and not house.isBeingRobbed then
        -- Code zum Überprüfen, ob der Hausbesitzer online ist
        -- Code zum Überprüfen des Spielerinventars auf die benötigten Werkzeuge (Dietrich, Sprengstoff, etc.)

        if --[Code zum Überprüfen der Werkzeuge im Inventar] then
            -- Code zum Starten des Einbruchs
            house.isBeingRobbed = true
            -- Code zum Senden einer Benachrichtigung an den Hausbesitzer über den Einbruch
            -- Code zum Informieren der Polizei über den Einbruch
        else
            -- Code zur Anzeige einer Benachrichtigung, dass der Spieler nicht über die benötigten Werkzeuge verfügt
        end
    end
end

function FinishHouseRobbery(playerId)
    local house = playerHouses[playerId]
    if house and house.isBeingRobbed then
        -- Code zum Abschließen des Einbruchs
        -- Code zum Zurücksetzen des Einbruchsstatus des Hauses
        house.isBeingRobbed = false
    end
end

RegisterCommand("createhouse", function(source, args, rawCommand)
    local playerId = source
    CreateHouse(playerId)
end)

RegisterCommand("addfurniture", function(source, args, rawCommand)
    local playerId = source
    local furniture = args[1]
    AddFurniture(playerId, furniture)
end)

RegisterCommand("placefurniture", function(source, args, rawCommand)
    local playerId = source
    local furniture = args[1]
    PlaceFurniture(playerId, furniture)
end)

RegisterCommand("renovatehouse", function(source, args, rawCommand)
    local playerId = source
    local r = tonumber(args[1])
    local g = tonumber(args[2])
    local b = tonumber(args[3])
    local wallColor = {r = r, g = g, b = b}
    RenovateHouse(playerId, wallColor)
end)

RegisterCommand("buymlo", function(source, args, rawCommand)
    local playerId = source
    local mloName = args[1]
    BuyMLO(playerId, mloName)
end)

RegisterCommand("stealkey", function(source, args, rawCommand)
    local playerId = source
    StealHouseKey(playerId)
end)

RegisterCommand("starthrobbing", function(source, args, rawCommand)
    local playerId = source
    StartHouseRobbery(playerId)
end)

RegisterCommand("finishrobbing", function(source, args, rawCommand)
    local playerId = source
    FinishHouseRobbery(playerId)
end)
 