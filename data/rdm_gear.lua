job_state = {
    -- F bindings
    {'f10', 'cycle', 'castingmode'},
    {'f9', 'cycle', 'offensemode'}
}

state.macc = M(false, "Magic accuracy")

state.OffenseMode:options(
    -- 'Normal',
    -- 'Enspell',
    -- 'Acc',
    -- 'Dual Wield',
    -- 'TH',
    'Magic Evasion',
    -- 'Refresh', 
    'DT'
)

state.CastingMode:options('Potency','Accuracy')

function user_setup() 

    weaponskills = {
        ['MND']              = S{'Savage Blade', 'Exenterator'},
        ['Earth']            = S{'Requiescat'},
        ['DEX']              = S{'Chant du Cygne'},
        ['Magic Atk. Bonus'] = S{'Aeolian Edge', 'Seraph Blade', 'Red Lotus Blade'},
        ['Dark']             = S{'Sanguine Blade'}
    }

    post_precast_spell_map = {['Stoneskin'] = S{'Stoneskin'}}

    midcast_spell_map = {
        ['Refresh']                      = S{'Refresh', 'Refresh II'}, 
        ['Protection']                   = S{'Protect V', 'Shell V'}, 
        ['Stoneskin']                    = S{'Stoneskin'}, 
        ['Aquaveil']                     = S{'Aquaveil'},
        ['Max Duration Enhancing Magic'] = S{'Haste', 'Haste II', 'Regen II'},
        ['Max Potency Enhancing Magic']  = S{'Temper II', 'Enstone', 'Enstone II', 'Enblizzard', 'Enblizzard II', 'Enaero', 'Enaero II', 'Enthunder II', 'Enfire', 'Enfire II'},
        ['Gain Spell']                   = S{'Gain-STR','Gain-MND','Gain-INT', 'Gain-DEX'},
        ['Spikes Spell']                 = S{'Shock Spikes', 'Ice Spikes'},
        ['Impact']                       = S{'Impact'},
        ['Phalanx']                      = S{'Phalanx', 'Phalanx II'},
        ['Bio']                          = S{'Bio III'},
        ['Stun']                         = S{'Stun'}
    }
    
                       
    job_ability_map = {'Composure', 'Chainspell', 'Saboteur'}
end

function init_gear_sets()

    ambuscade_sets         = require('equipment/ambuscade_sets')
    rdm_sets               = require('equipment/rdm_sets')
    gear_sets              = require('equipment/gear_sets')

    -- others = set_combine(rdm_sets['Empyrean'],
    -- {
    --     hands = rdm_sets['Relic'].hands
    -- })


    sets.engaged.Base = gear_sets['Engaged Base']

    sets.precast.FC = set_combine(gear_sets['Fast Cast'],
    {
        neck= {name="Voltsurge Torque", bag="Wardrobe 1"},
        head = rdm_sets['Artifact'].head,
        body = rdm_sets['Relic'].body,
        legs = ambuscade_sets['Ayanmo'].legs
        -- feet = rdm_sets['Empyrean'].feet
    })


    sets.precast.FC['Self Buffs Fast'] = set_combine(sets.precast.FC, 
        gear_sets['Fast Enhancing Magic']
    )

    sets.midcast['Healing Magic'] = set_combine(gear_sets['Healing Magic'], {
        legs = rdm_sets['Artifact'].legs
    })

    sets.midcast.Enfeebling = {}
    sets.midcast['Enfeebling Magic']= set_combine(
        gear_sets['Enfeebling Magic'], 
        {
            neck = rdm_sets['Accessories'].neck,
            head = rdm_sets['Relic'].head,
            body = rdm_sets['Empyrean'].body,
            hands = rdm_sets['Empyrean'].hands,
            legs = {name="Chironic Hose", bag="wardrobe 1"},
            feet = rdm_sets['Relic'].feet,
            back = rdm_sets['Accessories'].jse_cape_amb_magic,
            ammo = {name='regal gem', bag='wardrobe 1'}
        }
    )

    sets.midcast['Enfeebling Potency'] = sets.midcast['Enfeebling Magic']

    sets.midcast['Enfeebling Accuracy'] = set_combine(
        sets.midcast['Enfeebling Magic'],
        {
            head  = rdm_sets['Artifact'].head,
            body  = rdm_sets['Artifact'].body,
            hands = gear_sets['Enfeebling Magic'].hands,
            range = {name='ullr', bag='wardrobe 2'}
        }
    )

    sets.midcast['Impact'] = sets.midcast['Enfeebling Accuracy']

    sets.midcast['Elemental Magic'] = set_combine(
        ambuscade_sets['Jhakri'],
        gear_sets['Magic Atk. Bonus']
    )

    sets.midcast['Bio'] = set_combine(
        sets.midcast['Enfeebling Potency'],
        {
            legs= rdm_sets['Relic'].legs 
        }
    )

    -- sets.midcast['Dark Magic'] = sets.midcast['Enfeebling Accuracy']
    sets.midcast['Stun'] = set_combine(sets.midcast['Impact'],
       {
        range = {name='kaja bow', bag='wardrobe 2'},
        ring1 = {name="Stikini Ring", bag="wardrobe 1"},
        ring2 = {name="Stikini Ring", bag="wardrobe 3"},
        feet = ambuscade_sets['Jhakri'].feet,
        waist = {name="porous rope", bag="wardrobe 1"}
       } )


    sets.midcast.Enfeebling['MND'] = set_combine(
        sets.midcast.Enfeebling['MAcc'],
        {
            legs ={name="Perdition Slops",  bag="wardrobe"},
            ring1={name="Sirona's Ring",    bag="wardrobe"},
            waist={name="Porous rope",      bag="wardrobe"},
            back = rdm_sets['Accessories'].jse_cape_amb_magic
        }
    )

    sets.midcast.Enfeebling['INT'] = set_combine(ambuscade_sets['Jhakri'])

    sets.midcast['Enhancing Magic'] = set_combine(
        gear_sets['Enhancing Magic'],
        {
            neck  = rdm_sets['Accessories'].neck,
            body  = rdm_sets['Relic'].body,
            hands = rdm_sets['Relic'].hands,
            legs  = rdm_sets['Artifact'].legs,
            feet  = rdm_sets['Empyrean'].feet,
            back  = rdm_sets['Accessories'].jse_cape_ado
        }
    )

    sets.midcast['Max Potency Enhancing Magic'] = set_combine(
        sets.midcast['Enhancing Magic'],
        {
            back = rdm_sets['Accessories'].jse_cape_enhancing_max,
            waist = {name="olympus sash", bag="wardrobe 1"},
            neck = {name="colossus's torque", bag="wardrobe 1"}
        }
    )

    sets.midcast['Max Duration Enhancing Magic'] = set_combine(
        sets.midcast['Enhancing Magic'],
        {
            hands = rdm_sets['Artifact'].hands,
            waist =  gear_sets['Protection'].waist,
            head = gear_sets['Conserve MP'].head,
            legs = gear_sets['Conserve MP'].legs
        }
    )

    sets.midcast['Phalanx'] = set_combine(
        sets.midcast['Max Potency Enhancing Magic'],
        gear_sets['Taeon'],
        {
            main = {name="Egeking", bag="wardrobe 2"},
            waist =  gear_sets['Protection'].waist
        }
    )

    sets.midcast['Composure'] = set_combine(
        gear_sets['Enhancing Magic'],
        rdm_sets['Empyrean']
    )

    sets.midcast['Gain Spell'] = set_combine(
        sets.midcast['Max Duration Enhancing Magic'],
        {
            hands = rdm_sets['Relic'].hands
        }
    )

    sets.midcast['Spikes Spell'] = set_combine(
        sets.midcast['Max Duration Enhancing Magic'], 
        {
            legs = rdm_sets['Relic'].legs
        }
    )

    sets.midcast['Refresh'] = set_combine(
        sets.midcast['Max Duration Enhancing Magic'],
        {
            head = {name="Amalric Coif +1", bag="wardrobe 1"},
            body = rdm_sets['Artifact'].body,
            legs = rdm_sets['Empyrean'].legs,
            waist =  gear_sets['Protection'].waist
        }
    )

    sets.midcast['Stoneskin'] = set_combine(
        sets.midcast['Enhancing Magic'], 
        gear_sets['Fast Enhancing Magic']
    )

    sets.midcast['Aquaveil'] = set_combine(
        sets.midcast['Max Duration Enhancing Magic'], 
        {
            head = {name="Amalric Coif +1", bag="wardrobe 1"},
            waist = {name="Emphatikos rope", bag="wardrobe 1"} 
        }
    )

    sets.midcast['Protection'] = set_combine(
        sets.midcast['Max Duration Enhancing Magic'], 
        gear_sets['Protection']
    )

    sets.midcast['Others'] = set_combine(
        sets.midcast['Max Duration Magic'],
        rdm_sets['Empyrean'],
        {
            hands = rdm_sets['Artifact'].hands
        }
    )

    sets.movement_speed ={
        legs= gear_sets['Movement Speed']['RDM'].legs
    } 

    sets.idle =  set_combine(
        ambuscade_sets['Jhakri'], 
        gear_sets['Idle'], 
        {
            main = {name="Crocea Mors", bag="wardrobe 2"},
            head = rdm_sets['Relic'].head,
            body = rdm_sets['Artifact'].body,
            back= rdm_sets['Accessories'].jse_cape_amb_magic,
            hands = {name="Chironic gloves", bag="wardrobe 4"},
            -- legs = gear_sets['Movement Speed']['RDM'].legs,
            legs = rdm_sets['Relic'].legs,
            feet = rdm_sets['Artifact'].feet
    })

    sets.idle['Adoulin'] = gear_sets['Adoulin']

    sets.precast['Composure'] =  {
        head = rdm_sets['Empyrean'].head,
        body = rdm_sets['Empyrean'].body,
        hands = rdm_sets['Empyrean'].hands,
        legs = rdm_sets['Empyrean'].legs,
        feet = rdm_sets['Empyrean'].feet
    }

    sets.precast['Saboteur'] = {
        hands= rdm_sets['Empyrean'].hands
    }

    sets.precast['Chainspell'] = {
        body = rdm_sets['Relic'].body
    }

    sets.precast.WS['Earth'] = set_combine(
        gear_sets['Earth WS'],
        {
            head  = rdm_sets['Relic'].head,
            body  = rdm_sets['Relic'].body,
            hands = rdm_sets['Artifact'].hands,
            ring1 = {name="Leviathan Ring", bag="wardrobe 4"},
            ring2 = {name="Leviathan Ring", bag="wardrobe 4"},
            ear1 = {name="Aredan earring", bag="wardrobe 3"},
            legs = rdm_sets['Relic'].legs,
            feet = ambuscade_sets['Jhakri'].feet,
            ammo = {name="Regal Gem", bag="wardrobe 1"},
            back  = rdm_sets['Accessories'].jse_cape_amb_magic
        }
    )

    sets.precast.WS['MND'] = set_combine( 
        {
            head  = rdm_sets['Relic'].head,
            body  = rdm_sets['Relic'].body,
            neck = gear_sets['Magic Atk. Bonus'].neck,
            -- neck  = rdm_sets['Accessories'].neck,
            hands = ambuscade_sets['Jhakri'].hands,
            -- ring1 = {name="Ifrit Ring", bag="wardrobe 3"},
            -- ring2 = {name="Ifrit Ring", bag="wardrobe 3"},
            ring1 = gear_sets['Magic Atk. Bonus'].ring1,
            ring2 = {name="Leviathan Ring", bag="wardrobe 4"},
            -- ring2 = {name="Rufescent Ring", bag="wardrobe 4"},
            ear1 = gear_sets['Magic Atk. Bonus'].ear1,
            ear2 = gear_sets['Magic Atk. Bonus'].ear2,
            -- ear1 = {name="Ishvara earring", bag="wardrobe 2"},
            -- ear2 = {name="Aredan earring", bag="wardrobe 3"},
            -- waist = {name="Prosilio Belt +1", bag="wardrobe 4"},
            -- waist = {name="Porous Rope", bag="wardrobe 1"},
            waist = {name="Eschan Stone", bag="wardrobe 4"},
            legs = ambuscade_sets['Jhakri'].legs,
            -- legs = rdm_sets['Relic'].legs,
            -- feet = ambuscade_sets['Jhakri'].feet,
            feet = rdm_sets['Relic'].feet,
            ammo = {name="Regal Gem", bag="wardrobe 1"},
            back  = rdm_sets['Accessories'].jse_cape_amb_magic
        }
    )

    sets.precast.WS['DEX'] =  {
        head  = ambuscade_sets['Jhakri'].head,
        body  = rdm_sets['Relic'].body,
        -- hands = rdm_sets['Artifact'].hands,
        hands = rdm_sets['Artifact'].hands,
        neck  = {name='Breeze Gorget', bag="wardrobe 4"},
        ring1 = {name="Rajas Ring", bag="wardrobe 2"},
        ring2 = {name="Ramuh Ring", bag="wardrobe 4"},
        ear1 = {name="Ishvara earring", bag="wardrobe 2"},
        ear2 = {name="Mache earring", bag="wardrobe 4"},
        waist = {name="Aqua Belt", bag="wardrobe 2"},
        legs = rdm_sets['Relic'].legs,
        feet = ambuscade_sets['Jhakri'].feet,
        ammo = {name="Yetshila", bag="wardrobe 1"},
        back  = rdm_sets['Accessories'].jse_cape_amb_crit
    }

    sets.precast.WS['Magic Atk. Bonus'] = set_combine(
        sets.midcast['Elemental Magic'],
        {
            feet = rdm_sets['Relic'].feet
        }
    )

    sets.precast.WS['Dark'] = set_combine(
        sets.precast.WS['MND'],
        {
            head = {name="pixie hairpin +1", bag="wardrobe 1"},
            -- hands = ambuscade_sets['Jhakri'].hands,
            -- legs = ambuscade_sets['Jhakri'].legs,
            -- feet = rdm_sets['Relic'].feet
        }
    )

    sets.precast.WS['Normal'] = sets.precast.WS['Scission']

    state.DefenseMode['MDT'] = set_combine(
        sets.idle, 
        {
            head = ambuscade_sets['Inyanga'].head,
            body = ambuscade_sets['Inyanga'].body,
            ring1 = ambuscade_sets['Inyanga'].ring1
        }
    )

    sets.engaged = set_combine(ambuscade_sets['Ayanmo'], 
        sets.engaged.Base,
        {

            -- main = sets.idle.main,
            -- head   = rdm_sets['Relic'].head,
            -- body   = rdm_sets['Relic'].body,
            -- feet   = rdm_sets['Artifact'].feet,
            -- hands  = rdm_sets['Relic'].hands,
            -- hands  = {name="Volte Mittens", bag="wardrobe 2"},
            legs   = rdm_sets['Relic'].legs,
            waist  = {name="Goading Belt",bag="wardrobe 2"},
            back   = rdm_sets['Accessories'].jse_cape_amb_melee,
            -- feet = rdm_sets['Artifact'].feet
        }
    )

    sets.engaged['Normal'] = sets.engaged

    sets.engaged['Refresh'] = set_combine(
        sets.engaged, 
        {
            head = rdm_sets['Relic'].head,
            body = rdm_sets['Artifact'].body
        }
    )

    sets.engaged['Enspell'] = set_combine(sets.engaged, {
        head  = {name="Umuthi Hat", bag="wardrobe 2"},
        back = sets.midcast['Max Potency Enhancing Magic'].back,
        feet = rdm_sets['Empyrean'].feet
    })
     
    sets.engaged['TH'] = set_combine(
        sets.engaged, 
        {
            waist  = {name="Chaac Belt",bag="wardrobe 2"},
            hands  = {name="Chironic Gloves",bag="wardrobe 4"}
        }
    )

    sets.engaged['Acc'] = set_combine(
        sets.engaged, 
        {
            neck  = {name='iqabi necklace', bag='wardrobe 3'},
            ammo ={name="Hasty Pinion +1",  bag="wardrobe 1"},
            ear2 ={name="Assuage earring",  bag="wardrobe 2"}
        }
    )


    sets.engaged['Magic Evasion'] = set_combine(
        sets.engaged,
        {
            legs = rdm_sets['Relic'].legs,
            -- legs  = {name="Carmine Cuisses +1",bag="wardrobe 1"},
            -- hands = rdm_sets['Artifact'].hands,
            legs  = {name="Carmine Cuisses +1",bag="wardrobe 1"},
            ear1  = {name="Suppanomimi",bag="wardrobe 2"},
            feet = rdm_sets['Artifact'].feet,
            head = rdm_sets['Relic'].head,
            body = rdm_sets['Relic'].body
        }
    )


    sets.engaged['Dual Wield'] = set_combine(
        sets.engaged, 
        {
            legs  = {name="Carmine Cuisses +1",bag="wardrobe 1"},
            ear1  = {name="Suppanomimi",bag="wardrobe 2"}
        }
    )
    sets.engaged['DT'] = set_combine(
        sets.idle,
        {
            ear2 = {name="Odnowa Earring +1", bag="wardrobe 3"}
        },
        ambuscade_sets['Ayanmo']
        -- {
        --     -- legs = rdm_sets['Relic'].legs,
        --     -- ear1 = gear_sets['Engaged Base'].ear1,
        --     -- ear2 = gear_sets['Engaged Base'].ear2
        --     -- feet = rdm_sets['Artifact'].feet
        -- }
    )
end
