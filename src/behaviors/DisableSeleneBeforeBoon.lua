table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "DisableSeleneBeforeBoon",
        label = "Disable Selene Before First Boon",
        default = false,
        tooltip =
        "Prevents Selene from spawning before the first boon is obtained."
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
    key = "DisableSeleneBeforeBoon",
    fn = function()
        backup(NamedRequirementsData, "SpellDropRequirements")
        local additionalSpellReq = {
            Path = { "CurrentRun", "LootTypeHistory" },
            CountOf = {
                "AphroditeUpgrade", "ApolloUpgrade", "DemeterUpgrade",
                "HephaestusUpgrade", "HestiaUpgrade", "HeraUpgrade",
                "PoseidonUpgrade", "ZeusUpgrade", "AresUpgrade", "WeaponUpgrade"
            },
            Comparison = ">=",
            Value = 1
        }
        if NamedRequirementsData and NamedRequirementsData.SpellDropRequirements then
            local targetReqs = NamedRequirementsData.SpellDropRequirements
            if not ListContainsEquivalent(targetReqs, additionalSpellReq) then
                table.insert(targetReqs, additionalSpellReq)
            end
        end
    end
})
