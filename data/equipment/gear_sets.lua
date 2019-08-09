gear_sets = {}

-- Wardrobe 1 --
befouled_crown    = {name="Befouled Crown",    bag="Wardrobe 1"}
blood_cuisses     = {name="Carmine Cuisses +1",bag="wardrobe 1"}
brachyura_earring = {name="Brachyura Earring", bag="wardrobe 1"}
sheltered_ring    = {name="Sheltered Ring",    bag="wardrobe 1"}
colossuss_torque  = {name="Colossus's Torque", bag="wardrobe 1"}
anu_torque        = {name="Anu Torque",        bag="wardrobe 3"}
deviant_necklace  = {name="Deviant Necklace",  bag="wardrobe 3"}
witful_belt       = {name="Witful Belt",       bag="wardrobe 1"}
solemnity_cape    = {name="Solemnity Cape",    bag="wardrobe 1"}
porous_rope       = {name="Porous rope",       bag="wardrobe 1"}
rumination_sash   = {name="rumination sash",   bag="wardrobe 1"}
flume_belt        = {name="Flume Belt +1",     bag="wardrobe 3"}
kaykaus_cuffs     = {name="Kaykaus Cuffs +1",  bag="wardrobe 1"}
kaykaus_boots     = {name="Kaykaus boots",     bag="wardrobe 1"}
stikini_ring      = {name="Stikini Ring",      bag="wardrobe 1"}
stikini_ring2     = {name="Stikini Ring",      bag="wardrobe 3"}
kishar_ring       = {name="Kishar Ring",       bag="wardrobe 1"}
austerity_belt    = {name="Austerity Belt +1", bag="wardrobe 1"}
chirich_ring_1    = {name="Chirich Ring",      bag="wardrobe 4"}
chirich_ring_2    = {name="Chirich Ring",      bag="wardrobe 3"}
freke_ring        = {name="Freke Ring",        bag="wardrobe 1"}

-- Wardrobe 2 --
ishvara_earring   = {name="Ishvara Earring",   bag="wardrobe 2"}

-- Wardrobe 3 --
fajin_boots       = {name="Fajin Boots",       bag="wardrobe 3"}
lengo_pants       = {name="Lengo Pants",       bag="wardrobe 3"}
cala_earring      = {name="Calamitous Earring", bag="wardrobe 3"}
helios_band       = {name="Helios Band",       bag="wardrobe 3"}

gear_sets['Fast Cast'] = {
    -- waist = witful_belt,
    ring1 = {name="Kishar Ring", bag="wardrobe 1"},
    ring2 = {name="Prolix Ring", bag="wardrobe 1"},
    ear2={name= "Loquacious earring", bag="wardrobe 1"},
    feet=kaykaus_boots
}

gear_sets['Telchine'] = {
    body  = {name="Telchine chasuble", bag="wardrobe 3"},
    hands = {name="Telchine gloves", bag="wardrobe 3"},
    legs  = {name="Telchine braconi", bag="wardrobe 3"}, 
    feet  = {name="Telchine pigaches", bag="wardrobe 3"} 
}

gear_sets['Adoulin'] = {
    body = {name="Councilor's Garb", bag="wardrobe 4"}
}

gear_sets['Conserve MP'] = {
    -- ear1 ={name="Gifted Earring", bag="wardrobe 1"},
    head = helios_band,
    ear1 = cala_earring,
    ear2 ={name="Magnetic Earring", bag="wardrobe 3"},
    waist = austerity_belt,
    legs = lengo_pants,
    back = solemnity_cape
}

gear_sets['Magic Atk. Bonus'] = {
    ear2 = {name="Hecate's Earring", bag = "wardrobe 1"},
    ear1 = {name="Friomisi Earring", bag = "wardrobe 1"},
    neck = deviant_necklace,
    ring1 = freke_ring,
    ring2 = {name="Vertigo Ring", bag= "wardrobe 4"}
}

gear_sets['Fast Enhancing Magic'] = {
    waist={name="Siegel Sash",   bag="wardrobe 1"}
}

gear_sets['Enhancing Magic'] = {
    head  = befouled_crown,
    ear1  = gear_sets['Conserve MP'].ear1,
    ear2  = gear_sets['Conserve MP'].ear2,
    ring1 = stikini_ring,
    ring2 = stikini_ring2,
    neck  = colossuss_torque,
    waist = austerity_belt
}

gear_sets['Protection'] = set_combine(gear_sets['Conserve MP'], {
    ring2 = sheltered_ring
    -- ear1 = brachyura_earring
})

gear_sets['Enfeebling Magic'] = {
    head = befouled_crown,
    hands = kaykaus_cuffs,
    ear1 = {name="Hermetic Earring",   bag="wardrobe 2"},
    ear2 = {name="Aredan Earring",   bag="wardrobe 3"},
    ring1 = {name="Kishar ring",   bag="wardrobe 1"},
    ring2 = stikini_ring,
    waist = rumination_sash
}

gear_sets['Healing Magic'] = set_combine(gear_sets['Conserve MP'], {
    ear1 = {name="Mendicant's Earring",  bag="wardrobe 3"},
    ring1 = stikini_ring,
    ring2 = {name="mediator's ring",   bag="wardrobe 3"},
    -- neck = colossuss_torque,
    neck = deviant_necklace,
    body = {name="Vrikodara jupon",  bag="wardrobe 2"},
    hands = kaykaus_cuffs,
    feet = kaykaus_boots
})

gear_sets['Engaged Base'] = {
    -- neck ={name="Houyi's Gorget",    bag="wardrobe 2"},
    ammo ={name="ginsen",  bag="wardrobe 1"},
    neck = anu_torque,
    ear1 ={name="Cessance Earring",  bag="wardrobe 2"},
    ear2 ={name="Telos Earring",    bag="wardrobe 2"},
    ring1= chirich_ring_1,
    ring2= chirich_ring_2,
    waist={name="Sulla Belt",        bag="wardrobe 2"},
    back ={name="Atheling Mantle",   bag="wardrobe 2"}
}

gear_sets['Idle'] = {
    ammo ={name="homiliary",  bag="wardrobe 1"},
    ear1 = {name="Etiolation earring", bag="wardrobe 2"},
    ear2 = {name="Moonshade earring", bag="wardrobe 1"},
    -- neck = {name="Wiglen gorget",     bag="wardrobe 1"},
    neck = {name="Loricate Torque +1",     bag="wardrobe 4"},
    -- ring1= {name="Paguroidea Ring",   bag="wardrobe 1"},
    -- ring1= {name="Dark Ring",augments={"Physical damage taken -5%", "Magic damage taken -4%"},   bag="wardrobe 3" },
    ring1= {name="Dark Ring",augments={"Phys. dmg. taken -5%", "Magic dmg. taken -4%"}, bag="wardrobe 1" },
    ring2={name="defending ring", bag="wardrobe 3"},
    -- ring2= sheltered_ring,
    -- waist= witful_belt,
    -- waist= porous_rope,
    waist= flume_belt,
    back = solemnity_cape
}

gear_sets['Shneddick'] = {
    hands={name="Shneddick gloves +1", bag="wardrobe 3", haste=5},
    legs={name="Shneddick tights +1", bag="wardrobe 3", haste=1},
}

gear_sets['Taeon'] = {
    head  = {name="Taeon Chapeau", bag="wardrobe 3"},
    hands = {name="Taeon Gloves", bag="wardrobe 3"},
    feet  = {name="Taeon Boots", bag="wardrobe 3"}
}

gear_sets['Pursuer'] = {
    head={name="Pursuer's beret", bag="wardrobe 3"},
    body={name="Pursuer's doublet", bag="wardrobe 3"},
    feet={name="Pursuer's gaiters", bag="wardrobe 3"}
}

gear_sets['Movement Speed'] = {
    ['RDM'] = { 
        legs = blood_cuisses 
    },
    ['RUN'] = { legs = blood_cuisses },
    ['RNG'] = { legs = blood_cuisses },
    ['THF'] = { feet = fajin_boots }
}

gear_sets['Earth WS'] = set_combine(gear_sets['Weapon Skill'],
    {
        ear2 = ishvara_earring,
        waist={name="Soil Belt",       bag="wardrobe 2"},
        neck ={name="Soil Gorget",     bag="wardrobe 2"}
})


return gear_sets