
-- job_plugins = {
--   'debuffed'
-- }
state.macc = M(false, "Magic accuracy")
state.OffenseMode:options('Acc','Refresh')
function user_setup() 
    midcast_spell_map = {['Protection'] = S{'Protectra V', 'Shellra V'}, 
                         ['Aquaveil']   = S{'Aquaveil'},
                         ['Banish']     = S{'Banish III', 'Holy II'},
                         ['Max Duration'] = S{'Regen IV'},
                         ['Haste']       =S{'Haste'},
                         ['Erase']      = S{'Erase'},
                         ['Auspice']      = S{'Auspice'},
                         ['Barspell']   = S{'Barfira','Barwatera','Barstonra','Baraera','Barblizzara','Barthunder','Barthundra'}}
    job_ability_map = {'Benediction'}
    weaponskills = {['MND']= S{'Hexa Strike', 'Judgment'},
                    ['Acc'] = S{'Mystic Boon'},
                    ['MP'] = S{'Dagan'}}
  -- job_keybinds(player.main_job, player.sub_job) 
end
function init_gear_sets()

  ambuscade_sets = require('equipment/ambuscade_sets')
  gear_sets      = require('equipment/gear_sets')
  whm_sets       = require('equipment/whm_sets')

  sets.precast.FC = set_combine(gear_sets['Fast Cast'],
    {
      body  = ambuscade_sets['Inyanga'].body,
      head  = {name="Nahtirah Hat", bag="Wardrobe 1"},
      hands = {name="Fanatic Gloves", bag="Wardrobe 4"},
      neck  = {name="Voltsurge Torque", bag="Wardrobe 1"},
      waist = {name="Siegel Sash", bag="wardrobe 1"},
      legs  = ambuscade_sets['Ayanmo'].legs,
      feet  = {name="Chironic Slippers", bag="wardrobe 4"},
      back  = whm_sets['Accessories'].jse_cape_amb_magic,
      ammo  = {name="Incantor stone", bag="wardrobe 2"}
    })

  sets.midcast['Healing Magic'] = set_combine(gear_sets['Healing Magic'],
  {
    head = whm_sets['Empyrean Armor'].head,
    body = whm_sets['Empyrean Armor'].body,
    legs = whm_sets['Empyrean Armor'].legs,
    back = whm_sets['Accessories'].jse_cape_amb_magic,
    neck = whm_sets['Accessories'].neck
  })

  sets.midcast['Enhancing Magic'] = set_combine(gear_sets['Enhancing Magic'],
  {
    sub = {name="Ammurapi Shield", bag="wardrobe 1"},
    hands = {name="Dynasty Mitts", bag="wardrobe 1"},
    legs = whm_sets['Relic Armor'].legs,
    feet = whm_sets['Artifact Armor'].feet
  })

  sets.midcast['Max Duration'] = set_combine(sets.midcast['Enhancing Magic'],
    gear_sets['Telchine'],
    {
      main = {main="Bolelabunga", bag="wardrobe 2"},
      head = ambuscade_sets['Inyanga'].head
    }
  )

  sets.midcast['Haste'] = sets.midcast['Max Duration']



  sets.midcast['Erase'] = sets.midcast['Healing Magic']
  sets.midcast['Barspell'] = set_combine(sets.midcast['Enhancing Magic'],
  {
    main = {name="Beneficus", bag="wardrobe 3"},
    body = whm_sets['Empyrean Armor'].body,
    head = whm_sets['Empyrean Armor'].hands
  })


  sets.midcast['Banish'] = set_combine(sets.midcast['Healing Magic'],
    gear_sets['Magic Atk. Bonus'],
    {
      neck  = {name="Sanctity Necklace", bag="wardrobe 4"},
      hands = {name="Fanatic Gloves", bag="wardrobe 4"},
      body = {name="witching robe", bag="wardrobe 4"},
      waist = {name="eschan stone", bag="wardrobe 4"},
      ring2 = {name="Leviathan Ring", bag="wardrobe 4"},
      legs  = {name="Perdition Slops", bag="wardrobe 1"},
      feet  = {name="Chironic Slippers", bag="wardrobe 4"},
      head = {name="Welkin Crown", bag="wardrobe 4"},
      ammo = {name="Seraphic Ampulla", bag="wardrobe 3"}
    })



  sets.engaged = set_combine(gear_sets['Engaged Base'],
    ambuscade_sets['Ayanmo'],
  {
    neck={name="Sanctity Necklace", bag="wardrobe 4"},
    waist={name="eschan stone", bag="wardrobe 4"},
    back = whm_sets['Accessories'].jse_cape_amb_melee,
    ammo={name="Hasty Pinion +1", bag='wardrobe 1'}
  })


  others =whm_sets['Empyrean Armor']
  sets.midcast['Others'] = whm_sets['Empyrean Armor']
  sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC,
    {legs = {name="Ebers Pantaloons +1", bag="wardrobe 1"}}
     )
  -- sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC,
  --   })
  sets.midcast['Protection'] = gear_sets['Protection']

  sets.midcast['Enfeebling Accuracy'] = set_combine(gear_sets['Enfeebling Magic'],
    {
      main = {name="Maxentius", bag="wardrobe 1"},
      body = whm_sets['Artifact Armor'].body,
      back = whm_sets['Accessories'].jse_cape_amb_magic,
      neck = {name="Sanctity necklace", bag="wardrobe 4"},
      legs = {name="Chironic Hose", bag="wardrobe 1"}
   })

  sets.midcast['Elemental Magic'] = sets.midcast['Enfeebling Accuracy']

  sets.idle = set_combine(gear_sets['Idle'],
  {
    -- body = ambuscade_sets['Inyanga'].body,
    -- head = ambuscade_sets['Inyanga'].head,

    body  = whm_sets['Artifact Armor'].body,
    head  = {name="befouled crown", bag='wardrobe 1'},

    main = {name="Queller Rod", bag="wardrobe 1"},
    sub = {name="Genmei Shield", bag="wardrobe 1"},
    hands = {name="Chironic gloves", bag="wardrobe 4"},
    legs  = {name="Assiduity Pants +1", bag="Wardrobe 1"},
    waist = {name="Fucho-No-Obi", bag="wardrobe 1"},
    feet  = {name="Chironic Slippers", bag="wardrobe 1"},
    back  = whm_sets['Accessories'].jse_cape_amb_magic
  }) 

  sets.DefenseMode = {}
  sets.idle.MDT = set_combine(sets.idle, 
  {
      head = ambuscade_sets['Inyanga'].head,
      body = ambuscade_sets['Inyanga'].body,
      feet = ambuscade_sets['Inyanga'].feet,
      ring1 = ambuscade_sets['Inyanga'].ring1
  })
  sets.midcast['Divine Magic'] = sets.midcast['Enfeebling Accuracy']

  sets.midcast['Enfeebling Potency'] = sets.midcast['Enfeebling Accuracy']
  -- sets.precast.WS['MND'] = set_combine( 
  sets.precast.WS['MND'] = set_combine(gear_sets['Earth WS'],
      {
          head  = gear_sets['Enhancing Magic'].head,
          body  = whm_sets['Artifact Armor'].body,
          neck  = sets.engaged.neck,
          hands = sets.midcast['Enfeebling Potency'].hands,
          ring1 = {name="Leviathan Ring", bag="wardrobe 4"},
          ring2 = {name="Leviathan Ring", bag="wardrobe 4"},
          ear1 = {name="Ishvara earring", bag="wardrobe 2"},
          ear2 = {name="Aredan earring", bag="wardrobe 3"},
          legs = sets.midcast['Enfeebling Potency'].legs,
          feet  = {name="Chironic Slippers", bag="wardrobe 4"},
          ammo = {name="Hydrocera", bag="wardrobe 3"},
          back  = whm_sets['Accessories'].jse_cape_amb_magic
  })
  sets.precast.WS['MP'] =  {
    head  = whm_sets['Empyrean Armor'].head,
    body  = whm_sets['Artifact Armor'].body,
    neck  = whm_sets['Accessories'].neck,
    hands = sets.midcast['Enfeebling Potency'].hands,
    ring1 = sets.idle.ring1,
    ring2 = sets.idle.ring2,
    ear1 = sets.idle.ear1,
    ear2 ={name="Gifted Earring", bag="wardrobe 1"},
    legs = {name="Perdition Slops", bag="wardrobe 1"},
    feet  = sets.midcast['Healing Magic'].feet,
    ammo = {name="Hydrocera", bag="wardrobe 3"},
    back  = whm_sets['Accessories'].jse_cape_amb_magic
  }

  sets.precast.WS['Acc'] = set_combine(sets.engaged,
  {

  })
  sets.midcast['Aquaveil'] = set_combine(sets.midcast['Max Duration'], 
  {
     waist = {name="Emphatikos rope", bag="wardrobe 1"} 
  })
  sets.midcast['Auspice'] = set_combine(sets.midcast['Max Duration'], 
  {
     feet = whm_sets['Empyrean Armor'].feet
  })


  -- sets.midcast['Banish'] = set_combine(gear_sets['Magic Atk. Bonus'],
  -- {
  --   hands = {name="Fanatic Gloves", bag="wardrobe 4"}
  -- })

end