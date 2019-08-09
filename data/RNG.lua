spell_type  = {'Ninjutsu'}
job_ability = {'Scavenge', 'Sharpshot'}
weapon_skills = {'Slug Shot'}

function get_sets()
    mote_include_version = 2
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include('organizer-lib')
    include('algorithm/equip_logic')
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(3, 3)
end