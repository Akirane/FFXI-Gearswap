-- Map to spells/abilities/weaponskills --
-- End of map --

function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    include('organizer-lib')
    include('algorithm/equip_logic')
end


function job_setup()
    target_others = true
end