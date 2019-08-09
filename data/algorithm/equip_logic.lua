-- Equip logic --

-- Define the following tables in "name of job".lua:

-- weaponskills               = {[key]  = {string, string, ...}}
-- post_precast_spell_map     = {[key] = {string, string, ...}}
-- midcast_spell_map          = {[key] = {string, string, ...}}
-- job_ability_map            = {string, ...}

-- then include this library in get_sets()

function deepCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

local head_and_body_enabled = true
local old_sets = deepCopy(sets)
local event_zones = 
{
    294,
    295,
    296,
    297
}

-- zones: 183 omen
--        297 dyna jeuno

windower.register_event('zone change', function(new_id, old_id)
	if new_id == 256 or new_id == 257 then
        windower.add_to_chat('Equipping Adoulin movement speed gear.')
        sets.idle = set_combine(sets.idle, sets.idle['Adoulin'])
        return
    end
    for index, zone_id in pairs(event_zones) do
        if new_id == zone_id then
            windower.add_to_chat('Equipping event gear.')
            sets.idle = old_sets.idle
            return
        end
    end

    -- windower.add_to_chat('Equipping movement speed gear.')
 	-- sets.idle = set_combine(sets.idle, sets.movement_speed)
    --  else
    --     sets.idle = old_sets.idle
    -- end
    gearswap.equip_sets:schedule(1, 'equip_command', nil, sets.idle)
end)
-- windower.raw_register_event('zone change', zone_change)

function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Impact' then
        tempset = {body = {name='Twilight Cloak', bag='wardrobe 1'}, head = empty}
        equip(tempset)
        head_and_body_enabled = false
        disable('head')
        disable('body')
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    -- print(spell.action_type)
    if spell.action_type == 'Magic' then
        get_fast_cast_set(spell)
    elseif spell.action_type == "Ability" then 
        get_job_ability_set(spell)
        find_weaponskill_set(spell)
    end
    -- elseif spell.action_type == "WeaponSkill" then
    --     print('action')
    -- end
end

function get_fast_cast_set(spell)
    if post_precast_spell_map ~= nil then
        for i in pairs(post_precast_spell_map) do
            for j in pairs(post_precast_spell_map[i]) do
                if spell.english == j then 
                    equip(sets.precast.FC[post_precast_spell_map[i]])
                    return
                end
            end
        end
        equip(sets.precast.FC)
    end
end

-- function job_aftercast(spell, action, spellMap, eventArgs)
--     if head_and_body_enabled == false then 
--         head_and_body_enabled = true
--         windower.send_command('gs enable head')
--         windower.send_command('gs enable body')
--     end
--     if player.status == 'Idle' then
--         equip(sets.idle)
--     elseif player.status == 'Engaged' then
--         equip(sets.engaged)
--     end
-- end

function job_status_change(new_status, old_status)
    if player.status == 'Idle' then
        equip(sets.idle)
	elseif new_status == 'Engaged' then
        equip(sets.idle)
	end
end


function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
        get_magic_set(spell)
    end
end

function find_weaponskill_set(spell)
    if weaponskills ~= nil then
        for i in pairs(weaponskills) do
            for j in pairs(weaponskills[i]) do
                if spell.english == j then 
                    equip(sets.precast.WS[i])
                    return
                end
            end
        end
    end
    equip(sets.precast.WS['Normal'])
end

function get_magic_set(spell)
    if midcast_spell_map ~= nil then
        for i in pairs(midcast_spell_map) do
            for j in pairs(midcast_spell_map[i]) do
                if spell.english == j then 
                    sets.midcast[spell.skill] = combine_other_targets_set(spell, i, true)
                    return
                end
            end
        end
    end
    -- print('Spell skill:', spell.skill)
    sets.midcast[spell.skill] = combine_other_targets_set(spell, spell.skill, false)
end


function combine_other_targets_set(spell, equip_name, use_spell)
    -- print(equip_name)
    -- print(target_others)
    if target_others == true and spell.skill == 'Enhancing Magic'then
        if use_spell == true then 
            --  inner_other_targets_set(spell, sets.midcast[spell.english], old_sets.midcast[spell.english])
            return inner_other_targets_set(spell, sets.midcast[equip_name], old_sets.midcast[equip_name])
        else 
            -- sets.midcast[spell.skill] = inner_other_targets_set(spell, sets.midcast[spell.skill], old_sets.midcast[spell.skill])
            return inner_other_targets_set(spell, equip_set, old_sets.midcast[spell.skill])
        end
    else
        -- print(use_spell)
        if use_spell == true then
            -- return sets.midcast[spell.english] = old_sets.midcast[spell.english]
            -- print(old_sets.midcast[equip_name].body.name)
            return old_sets.midcast[equip_name]
        else
            if spell.skill == 'Enfeebling Magic' then
                if state.CastingMode.value == 'Accuracy' then
                    disable('ammo')
                    return old_sets.midcast['Enfeebling Accuracy']
                else
                    enable('ammo')
                    return old_sets.midcast['Enfeebling Potency']
                end
            else
                return old_sets.midcast[spell.skill]     
            end
        end
    end
end

function inner_other_targets_set(spell, equip_set, old_equip_set)
    if spell.target.type == 'NPC' or spell.target.type == 'PLAYER' then
        -- print("Other target")
        return set_combine(old_equip_set, sets.midcast['Others'])
    else 
        -- print("No target")
        return old_equip_set
    end
end

function get_job_ability_set(spell)
    if job_ability_map ~= nil then
        for i in pairs(job_ability_map) do
            if spell.english == job_ability_map[i] then 
                equip(sets.precast[job_ability_map[i]])
                return
            end
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if head_and_body_enabled == false then 
        head_and_body_enabled = true
        enable('head')
        enable('body')
    end
  if player.status == 'Idle' then
    if state.DefenseMode ~= 'None' then
        if state.DefenseMode.current == 'Magical' then
            sets.idle = old_sets.idle.MDT
        else
            sets.idle = old_sets.idle
        end
    else
        sets.idle = old_sets.idle
    end
  elseif player.status == 'Engaged' then
    -- if (player.target.hpp <= 20) then
    --     equip({back={name="Aptitude's Mantle", bag="Wardrobe 2"}})
    --     disable('back')
    -- end
    equip(sets.engaged)
  end
end