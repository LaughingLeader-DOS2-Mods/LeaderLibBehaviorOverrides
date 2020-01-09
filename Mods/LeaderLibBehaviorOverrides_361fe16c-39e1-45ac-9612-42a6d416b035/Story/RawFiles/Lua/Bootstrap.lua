local function LeaderLibBehaviorOverrides_ModUpdated(id,author,past_version,new_version)
    -- local version_is_less_than = _G["LeaderLib_Ext_VersionIsLessThan"]
    -- if version_is_less_than ~= nil then
    --     if version_is_less_than(past_version, 1,1,0,0) == true then
            
    --     end
    -- end
end

local function LeaderLibBehaviorOverrides_Ext_Debug()
    --local character = CharacterGetHostCharacter()
end

local function SessionLoading()
    if _G["LeaderLib_Ext_RegisterMod"] ~= nil then
        local func = _G["LeaderLib_Ext_RegisterMod"]
        func("LeaderLibBehaviorOverrides", "LaughingLeader", 1,0,0,0, "361fe16c-39e1-45ac-9612-42a6d416b035")
    end

    if _G["LeaderLib_ModUpdater"] ~= nil then
        local update_table = _G["LeaderLib_ModUpdater"]
        update_table["361fe16c-39e1-45ac-9612-42a6d416b035"] = LeaderLibBehaviorOverrides_ModUpdated
    end

    if _G["LeaderLib_DebugInitCalls"] ~= nil then
        local debug_table = _G["LeaderLib_DebugInitCalls"]
        debug_table[#debug_table+1] = LeaderLibBehaviorOverrides_Ext_Debug
    end
end

--v36 and higher
if Ext.RegisterListener ~= nil then
    Ext.RegisterListener("SessionLoading", SessionLoading)
end