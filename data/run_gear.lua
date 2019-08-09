
function user_setup() 
  xivhotbar_keybinds_job = require('hotbar/run_hotbar')
  gear_sets              = require('equipment/gear_sets')
  run_sets               = require('equipment/run_sets')
  ambuscade_sets         = require('equipment/ambuscade_sets')
  weaponskills = {['Scission'] = S{'Resolution', 'Requiescat', 'Savage Blade', 'Exenterator'}}
  job_ability_map = {'Vallation'}
  post_precast_spell_map = {['Stoneskin'] = S{'Stoneskin', 'Phalanx', 'Blink', 'Crusade'}}
  midcast_spell_map = {['Protection']      = S{'Protect V', 'Shell V'},
                      ['Stoneskin']       = S{'Stoneskin'}}
  -- for i, v in ipairs(xivhotbar_keybinds_job) do
  --   send_command('htb set '..v[1]..' '..v[2]..' "'..v[3]..'" '..v[4]..' "'..v[5]..'"')
  -- end  
  -- for i, v in ipairs(xivhotbar_keybinds_subjob[player.sub_job]) do
  --   send_command('htb set '..v[1]..' '..v[2]..' "'..v[3]..'" '..v[4]..' "'..v[5]..'"')
  -- end  
  -- for i, v in ipairs(xivhotbar_keybinds_general) do
  --   send_command('htb set '..v[1]..' '..v[2]..' "'..v[3]..'" '..v[4]..' "'..v[5]..'"')
  -- end  
  -- job_keybinds(player.main_job, player.sub_job) 
end
function init_gear_sets()

    sets.idle = set_combine(ambuscade_sets['Ayanmo'], 
                            gear_sets['Idle'], 
                            gear_sets['Movement Speed']['RUN'])

    sets.engaged = set_combine(gear_sets['Engaged Base'], ambuscade_sets['Ayanmo'])

    sets.precast.FC = set_combine(gear_sets['Fast Cast'],
    {
      legs = ambuscade_sets['Ayanmo'].legs,
      feet = {name="Chelona Boots", bag="Wardrobe 1"}
    })

    sets.precast.FC['Stoneskin'] = set_combine(sets.precast.FC,
                                                     gear_sets['Fast Enhancing Magic']) 
    sets.midcast['Enhancing Magic'] = set_combine(sets.engaged, gear_sets['Conserve MP'],
                                                  gear_sets['Enhancing Magic'])

    sets.midcast['Stoneskin'] = set_combine(sets.engaged, gear_sets['Fast Cast'],
                                                    gear_sets['Enhancing Magic'], 
                                                    gear_sets['Fast Enhancing Magic'])

    sets.midcast['Protection'] = set_combine(sets.midcast['Enhancing Magic'], 
        gear_sets['Protection']
    )

    sets.precast.WS['Resolution'] = gear_sets['Earth WS']

    sets.precast.Vallation = run_sets['Accessories']
    

end