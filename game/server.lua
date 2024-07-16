lib.callback.register('tiz-search:server:checkInv', function(source, id, serid)
    local check = lib.callback.await('tiz-search:client:checkHands', source, id)
    if check then
        return exports.ox_inventory:forceOpenInventory(source, 'player', serid)
    else
        return false
    end
end)
