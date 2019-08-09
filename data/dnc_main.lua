-- Load and initialize the include file.

function init_gear_sets()

	sets.precast['Exenterator'] = {
	    neck={name="Soil Gorget", bag="wardrobe 2"}, 
	    waist={name="Soil Belt", bag="wardrobe 2"} 
	}

	sets.engaged = {
		head={name="Thurandaut Chapeau +1", bag="wardrobe 2"},
		neck={name="Houyi's Gorget", bag="wardrobe 2"},
		body={name="Schneddick tabard +1", bag="wardrobe 2"},
		hands={name="Schneddick bracers +1", bag="wardrobe 2"},
		legs={name="Espial Hose", bag="wardrobe 2"},
		feet={name="Schneddick boots +1", bag="wardrobe 2"},
		ear1={name="Brutal Earring", bag="wardrobe 2"},
		ear2={name="Cessance Earring", bag="wardrobe 2"},
		ring1={name="Tyrant's Ring", bag="wardrobe 2"},
		ring2={name="Rajas Ring", bag="wardrobe 2"},
		waist={name="Twilight Belt", bag="wardrobe 2"},
		back={name="Atheling Mantle", bag="wardrobe 2"}
	}
end

function precast(spell)
	if spell.type=="WeaponSkill" then
		if spell.english == 'Requiescat' then
			equip(sets.precast['Requiescat'])
		elseif spell.english == 'Exenterator' then
	        windower.add_to_chat(8,'----- Set changed to Exenterator-----')
			equip(sets.precast['Exenterator'])
		end
	end
end

function aftercast(spell)
    -- if player.status == 'Idle' then
    --     equip(sets.idle)
    if player.status == 'Engaged' then
        windower.add_to_chat(8,'----- Set changed to Exenterator-----')
    	equip(sets.engaged)
    end
end
