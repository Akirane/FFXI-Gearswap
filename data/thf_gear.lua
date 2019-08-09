
gear_sets = require('equipment/gear_sets')
macro_book = 2             

function user_setup() 
	gear_sets              = require('equipment/gear_sets')
	thf_sets               = require('equipment/thf_sets')
	xivhotbar_keybinds_job = require('hotbar/thf')
	weaponskills = {['Scission']         = S{'Requiescat', 'Savage Blade', 'Exenterator'},
					['Magic Atk. Bonus'] = S{'Aeolian Edge'}}
end

function init_gear_sets()

	sets.precast.WS['Normal'] = gear_sets['Earth WS']
	sets.precast.WS['Magic Atk. Bonus'] = set_combine(sets.precast.WS['Earth WS'], gear_sets['Magic Atk. Bonus'])

	sets.idle = set_combine({
		head= gear_sets['Pursuer'].head,
		neck={name="Wiglen gorget", bag="wardrobe"},
		ring2={name="Sheltered Ring", bag="wardrobe"},
	}, gear_sets['Movement Speed']['THF'])

	sets.engaged = set_combine(gear_sets['Engaged Base'], {
		head  = {name="Skormoth mask",bag="wardrobe 3"},
		body  = gear_sets['Pursuer'].body,
		hands  = {name="Floral Gauntlets", bag="wardrobe 4"},
		legs  = {name="Samnuha tights", bag="wardrobe 4"},
		feet  = gear_sets['Pursuer'].feet,
		ear1  = {name="Suppanomimi",bag="wardrobe 2"},
		waist = {name="Twilight Belt", bag="wardrobe 3"},
		back  = thf_sets['Accessories'].jse_cape_ado
	})
end

