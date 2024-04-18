-- Define the spawn points for the encounter
local spawnPoints = {
    { x = -1000.0, y = 500.0, z = 50.0 },
    { x = -900.0, y = 600.0, z = 50.0 },
    { x = -1100.0, y = 700.0, z = 50.0 }
}

-- Function to spawn enemies
function spawnEnemies()
    for _, point in ipairs(spawnPoints) do
        local ped = CreatePed(28, "a_m_m_skater_01", point.x, point.y, point.z, true, true)
        TaskWanderStandard(ped, true, true)
    end
end

-- Function to trigger the encounter
function triggerRandomEncounter()
    local chance = math.random(1, 10)
    if chance <= 5 then
        spawnEnemies()
        TriggerClientEvent("chat:addMessage", -1, {
            color = {255, 0, 0},
            multiline = true,
            args = {"Random Encounter", "Watch out! Enemies have appeared!"}
        })
    else
        TriggerClientEvent("chat:addMessage", -1, {
            color = {255, 255, 255},
            multiline = true,
            args = {"Random Encounter", "Nothing seems to happen..."}
        })
    end
end

-- Command to trigger the encounter
RegisterCommand("randomencounter", function(source, args, rawCommand)
    triggerRandomEncounter()
end)
