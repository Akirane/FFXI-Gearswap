local rdm_sets = {}

rdm_sets['Artifact'] = {
    head  = {name="Atrophy Chapeau +2", bag = "wardrobe 1"},
    body  = {name="Atrophy Tabard +3",  bag = "wardrobe 1"},
    hands = {name="Atrophy Gloves +3",  bag = "wardrobe 1"},
    legs  = {name="Atrophy Tights +2",  bag = "wardrobe 1"},
    feet  = {name="Atrophy Boots +3",  bag = "wardrobe 1"}
}

rdm_sets['Relic'] = {
    head  = {name="Vitiation Chapeau +2", bag="wardrobe 1"},
    body  = {name="Vitiation Tabard +3",  bag="wardrobe 1"},
    hands = {name="Vitiation Gloves +2",  bag="wardrobe 1"},
    legs  = {name="Vitiation Tights +3",  bag="wardrobe 1"},
    feet  = {name="Vitiation Boots +2",   bag="wardrobe 1"}
}

rdm_sets['Empyrean'] = {
    head  = {name="Lethargy Chappel +1",    bag="wardrobe 1"},
    body  = {name="Lethargy Sayon +1",      bag="wardrobe 1"},
    hands = {name="Lethargy Gantherots +1", bag="wardrobe 1"},
    legs  = {name="Lethargy Fuseau +1",     bag="wardrobe 1"},
    feet  = {name="Lethargy houseaux +1",   bag="wardrobe 1"}
}

rdm_sets['Accessories'] = {
    neck         = {name="Duelist's Torque +1", bag="wardrobe 2"},
    -- jse_cape_amb_magic = {name="Sucellos's cape",augments={"MND+30", "Mag. Acc.+20/Mag. Dmg.+20", "Weapon skill damage +10%", "Damage taken -5%"}, bag="wardrobe 1"},
    jse_cape_amb_magic = {name="Sucellos's cape",augments={"Damage taken -5%"}, bag="wardrobe 1"},
    jse_cape_amb_melee ={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}, bag='wardrobe 2'},
    jse_cape_amb_crit={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+7','Crit.hit rate+10','System: 1 ID: 640 Val: 4',}},
    jse_cape_ado = {name="Ghostfyre Cape",      bag="wardrobe 1"},
    jse_cape_enhancing_max = { name="Ghostfyre Cape", augments={'Enfb.mag. skill +6','Enha.mag. skill +9','Mag. Acc.+5','Enh. Mag. eff. dur. +15',}},
}

return rdm_sets