table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "PreventEchoScam",
        label = "Prevent Echo Scam",
        default = false,
        tooltip =
        "Prevents Echo scam by blocking both minibosses from spawning at room 3."
    })

local function DeepCompare(a, b)
    if a == b then return true end
    if type(a) ~= type(b) then return false end
    if type(a) ~= "table" then return false end
    for key, value in pairs(a) do
        if not DeepCompare(value, b[key]) then return false end
    end
    for key in pairs(b) do
        if a[key] == nil then return false end
    end
    return true
end

local function ListContainsEquivalent(list, template)
    if type(list) ~= "table" then return false end
    for _, entry in ipairs(list) do
        if DeepCompare(entry, template) then return true end
    end
    return false
end

table.insert(apply_fns, {
    key = "PreventEchoScam",
    fn = function()
        backup(RoomData["H_MiniBoss01"], "GameStateRequirements")
        backup(RoomData["H_MiniBoss02"], "GameStateRequirements")
        local newReq = {
            Path = { "CurrentRun", "BiomeDepthCache" },
            Comparison = "!=",
            Value = 3,
        }
        for _, roomName in ipairs({ "H_MiniBoss01", "H_MiniBoss02" }) do
            local reqs = RoomData[roomName].GameStateRequirements
            if reqs and not ListContainsEquivalent(reqs, newReq) then
                table.insert(reqs, newReq)
            end
        end
    end
})
