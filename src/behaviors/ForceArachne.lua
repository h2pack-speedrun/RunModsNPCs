table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "ForceArachne",
        label = "Force Arachne Spawn",
        default = false,
        tooltip =
        "Forces Arachne to spawn to reduce death pity reset."
    })
table.insert(apply_fns, {
    key = "ForceArachne",
    fn = function()
        backup(RoomSetData.F.F_Story01, "ForceAtBiomeDepthMin")
        backup(RoomSetData.F.F_Story01, "ForceAtBiomeDepthMax")
        RoomSetData.F.F_Story01.ForceAtBiomeDepthMin = 4
        RoomSetData.F.F_Story01.ForceAtBiomeDepthMax = 8
    end
})
