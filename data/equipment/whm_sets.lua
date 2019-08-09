local whm_sets = {}
whm_sets['Empyrean Armor'] = {

    head  = {name="Ebers Cap +1", bag="wardrobe 1"},
	body  = {name="Ebers Bliaud +1", bag="wardrobe 1"},
    legs  = {name="Ebers Pantaloons +1",     bag="wardrobe 1"},
    feet  = {name="Ebers duckbills +1",     bag="wardrobe 1"}
}

whm_sets['Artifact Armor'] = {
	body = {name="Theophany briault +2", bag="wardrobe 1"},
	feet = {name="Theophany duckbills +2", bag="wardrobe 1"}
}

whm_sets['Relic Armor'] = {
	legs = {name="Piety pantaloons +1", bag="wardrobe 2"}
}

whm_sets['Accessories'] = {
    -- jse_cape_amb_magic = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%'}, bag="wardrobe 4"},
    jse_cape_amb_melee={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+2','"Dbl.Atk."+10','Phys. dmg. taken-4%'}},
    jse_cape_amb_magic = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
    neck = {name="Cleric's Torque +1", bag="wardrobe 2"}
}
return whm_sets