local wasabi_ambulance = exports.wasabi_ambulance
local ox_target = exports.ox_target

local function isRaisingHands(entity)
	if (IsEntityPlayingAnim(entity, 'random@mugging3', 'handsup_standing_base', 3)) or (IsEntityPlayingAnim(entity, 'missminuteman_1ig_2', 'handsup_base', 3)) or (IsEntityPlayingAnim(entity, 'cpr_pumpchest_idle', 'mini@cpr@char_b@cpr_def', 3)) or (IsPedCuffed(entity)) then return true end
    return false
end
local function isDead(entity)
    if Config.Ambulance == 'wasabi' then
        return wasabi_ambulance:isPlayerDead(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)))
    else
        return IsPedDeadOrDying(entity, true)
    end
end

lib.callback.register('tiz-search:client:checkHands', function(entity)
    if isRaisingHands(entity) or isDead(entity) then
        lib.progressBar({
            duration = Config.TimeSearch,
            label = Config.Language.searching,
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
            anim = {
                dict = Config.Animation.dict,
                clip = Config.Animation.clip
            },
        })
        return true
    else
        return false
    end
end)

ox_target:addGlobalPlayer({
    {
        name = 'searchPlayer',
        icon = 'fa-regular fa-hand',
        label = Config.Language.search,
        distance = 3,
        onSelect = function(data)
            local allowed = lib.callback.await('tiz-search:server:checkInv', false , data.entity, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            if not allowed then
                return lib.notify({
                    title = Config.Language.targetlabel,
                    description = Config.Language.nohands,
                    type = 'error'
                })
            end
        end
    }
})