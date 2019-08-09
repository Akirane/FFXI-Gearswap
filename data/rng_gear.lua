

function user_setup() 
	xivhotbar_keybinds_job = require('hotbar/rng')
	gear_sets              = require('equipment/gear_sets')
	rng_sets               = require('equipment/rng_sets')
	macro_book = 2
end

function init_gear_sets()

	sets.precast['Ninjutsu'] = gear_sets['Fast Cast']
	
	sets.precast['WS'] = {
		head={name="Hakke Hachimaki", bag="wardrobe 2"},
		hands={name= "Ocelot Gloves", bag="wardrobe 2"},
		waist={name= "Sveltesse gouriz", bag="wardrobe 2"},
		feet={name= "Hunter's Socks", bag="wardrobe 2"}
	--    neck={name= "", bag="wardrobe 2"}, 
	--    waist={name= "", bag="wardrobe 2"} 
	}

	sets.precast['Scavenge'] = {
		feet= rng_sets['Artifact Armor'].feet
	--    waist={name= "", bag="wardrobe 2"} 
	}
	sets.precast['Sharpshot'] = {
		legs = rng_sets['Artifact Armor'].legs
	--    waist={name= "", bag="wardrobe 2"} 
	}

	sets.idle = set_combine(gear_sets['Idle'], {legs = gear_sets['Movement Speed']['RNG']})

	sets.engaged = {
		head = rng_sets['Relic Armor'].head,
		neck={name= "Peacock Charm", bag="wardrobe 2"},
		body={name= "Loki's Kaftan", bag="wardrobe 2"},
		hands={name= "Gules Mittens", bag="wardrobe 2"},
		legs = rng_sets['Relic Armor'].legs,
		feet = rng_sets['Relic Armor'].feet,
		ear1={name= "Drone Earring", bag="wardrobe 2"},
		ear2={name= "Drone Earring", bag="wardrobe 2"},
		ring1={name= "Rajas Ring", bag="wardrobe 2"},
		ring2={name= "Woodsman Ring", bag="wardrobe 2"},
		waist={name= "Venturer's belt", bag="wardrobe 2"},
		back={name= "Amemet Mantle +1", bag="wardrobe 2"}
	}
end