table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "ForceMedea",
        label = "Force Medea Spawn",
        default = false,
        tooltip =
        "Forces Medea to spawn to reduce death pity reset."
    })
table.insert(apply_fns, {
    key = "ForceMedea",
    fn = function()
        backup(RoomSetData.N.N_Story01, "ForceAtBiomeDepthMin")
        backup(RoomSetData.N.N_Story01, "ForceAtBiomeDepthMax")
        RoomSetData.N.N_Story01.ForceAtBiomeDepthMin = 0
        RoomSetData.N.N_Story01.ForceAtBiomeDepthMax = 1
    end
})
