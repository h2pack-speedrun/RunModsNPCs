table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "DisableArachnePity",
        label = "Disable Arachne Pity",
        default = false,
        tooltip =
        "Disables Arachne Pity entirely for Anyfear runs."
    })
table.insert(apply_fns, {
    key = "DisableArachnePity",
    fn = function()
        backup(RoomSetData.F.F_Story01, "ForceIfUnseenForRuns")
        RoomSetData.F.F_Story01.ForceIfUnseenForRuns = nil
    end
})
