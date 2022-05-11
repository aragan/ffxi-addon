-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
  
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
  
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include('organizer-lib')
end
  
-- Setup vars that are user-independent.
function job_setup()
    state.CapacityMode = M(false, 'Capacity Point Mantle')
    send_command('wait 2;input /lockstyleset 200')
    include('Mote-TreasureHunter')
    state.TreasureMode:set('None')
  
    state.Buff.Souleater = buffactive.souleater or false
    state.Buff['Last Resort'] = buffactive['Last Resort'] or false
    -- Set the default to false if you'd rather SE always stay acitve
    state.SouleaterMode = M(true, 'Soul Eater Mode')
    -- state.LastResortMode = M(false, 'Last Resort Mode')
    -- Use Gavialis helm?
    use_gavialis = true
  
    -- Weaponskills you want Gavialis helm used with (only considered if use_gavialis = true)
    wsList = S{}
    -- Greatswords you use. 
    gsList = S{'Ragnarok','Caladbolg','Nandaka'}
    scytheList = S{'Liberator', 'Apocalypse'}
    remaWeapons = S{'Apocalypse', 'Liberator', 'Caladbolg', 'Ragnarok','Nandaka'}
  
    shields = S{}
    -- Mote has capitalization errors in the default Absorb mappings, so we use our own
    absorbs = S{'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 'Absorb-MaxAcc', 'Absorb-TP'}
    -- Offhand weapons used to activate DW mode
    swordList = S{}
  
    get_combat_form()
    get_combat_weapon()
    update_melee_groups()
end
  
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
  
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'STP', 'MidAcc', 'MaxAcc')
    state.HybridMode:options('Normal', 'Meva', 'PDT')
    state.WeaponskillMode:options('Normal', 'MaxAcc', 'Max')  ---Max for Scythe removes Ratri for safer WS---For Resolution removes Agrosy for Meva---
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.MagicalDefenseMode:options('MDT', 'HP')
      
    war_sj = player.sub_job == 'WAR' or false
  
    -- Additional local binds
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind != gs c toggle CapacityMode')
    send_command('bind @f9 gs c toggle SouleaterMode')
    select_default_macro_book()
end
  
function user_unload()
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind @f10')
    send_command('unbind @f11')
end
  
  
-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------
      
    -- Precast sets to enhance JAs
    sets.precast.JA['Last Resort'] = {back="Ankou's mantle"}
    sets.precast.JA['Nether Void'] = {Legs="Heathen's Flanchard +1"}
    sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +3"}
    sets.precast.JA['Arcane Circle'] = {feet="Ignominy Sollerets +3"}
    sets.precast.JA['Weapon Bash'] = {hands="Ignominy Gauntlets +3"}
    sets.precast.JA['Souleater'] = {head="Ignominy Burgonet +3"}
    sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +3"}
    sets.precast.JA['Diabolic Eye'] = {hands="Fall. Fin. Gaunt. +3"}
      
      
  
  
   
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
          
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
      
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}
  
    -- Fast cast sets for spells
      
    sets.precast.FC = {
        ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Sacro Breastplate",
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs="Sakpata's Cuisses",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Orunmila's Torque",
    waist="Tempus Fugit +1",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
}
  
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
  
         
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        sub="Utu Grip",
        ammo="Knobkierrie",
        head="Ratri Sallet",
        body="Ratri Plate",
        hands="Ratri Gadlings",
        legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
        feet="Sulev. Leggings +2",
        neck="Fotia Gorget",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Beithir Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
}
  
  
    sets.precast.WS.MaxAcc = set_combine(sets.precast.WS, {
        
    })
  
   
    sets.precast.WS.Max = set_combine(sets.precast.WS, {
        
    })
  
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Catastrophe'] = {
        sub="Utu Grip",
        ammo="Knobkierrie",
        head="Ratri Sallet",
        body="Ratri Plate",
        hands="Ratri Gadlings",
        legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
        feet="Sulev. Leggings +2",
        neck="Fotia Gorget",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Beithir Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
}
  
    sets.precast.WS['Catastrophe'].MaxAcc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Catastrophe'].Max = set_combine(sets.precast.WS['Catastrophe'], {})
  
  
sets.precast.WS['Insurgency'] = {
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Beithir Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
}
  
    sets.precast.WS['Insurgency'].MaxAcc = set_combine(sets.precast.WS['Insurgency'], {})
    sets.precast.WS['Insurgency'].Max = set_combine(sets.precast.WS['Insurgency'], {head="Sakpata's Helm",})
  
    sets.precast.WS['Cross Reaper'] = {
        sub="Utu Grip",
        ammo="Knobkierrie",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
        feet="Sakpata's Leggings",
        neck="Fotia Gorget",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Beithir Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
}
  
    sets.precast.WS['Cross Reaper'].MaxAcc = set_combine(sets.precast.WS['Catastrophe'], {})
    sets.precast.WS['Cross Reaper'].Max = set_combine(sets.precast.WS['Catastrophe'], {})
  
sets.precast.WS['Quietus'] = {
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Ratri Sallet",
    body="Ratri Plate",
    hands="Ratri Gadlings",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Beithir Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
} 

sets.precast.WS['Entropy '] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Cessance Earring",
    left_ring="Beithir Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
} 

sets.precast.WS['Infernal Scythe'] = {    ammo="Knobkierrie",
head="Pixie Hairpin +1",
body="Ratri Plate",
hands={ name="Valorous Mitts", augments={'"Store TP"+1','MND+1','Weapon skill damage +8%','Accuracy+8 Attack+8','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
feet="Sulev. Leggings +2",
neck="Baetyl Pendant",
waist="Orpheus's Sash",
left_ear="Friomisi Earring",
right_ear="Malignance Earring",
left_ring="Archon Ring",
right_ring="Epaminondas's Ring",
back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
}
sets.precast.WS['Infernal Scythe'].MaxAcc = set_combine(sets.precast.WS['Torcleaver'], {})
sets.precast.WS['Infernal Scythe'].Max = set_combine(sets.precast.WS['Torcleaver'], {
    
})
          
    sets.precast.WS['Resolution'] = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Schere Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Beithir Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
  
    sets.precast.WS['Resolution'].MaxAcc = set_combine(sets.precast.WS['Resolution'], {})
    sets.precast.WS['Resolution'].Max = set_combine(sets.precast.WS['Resolution'], {})
      
    sets.precast.WS['Ground Strike'] = {
        sub="Utu Grip",
        ammo="Knobkierrie",
        head="Ratri Sallet",
        body="Ratri Plate",
        hands="Ratri Gadlings",
        legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
        feet="Sulev. Leggings +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Thrud Earring",
        left_ring="Beithir Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
    } 
  
    sets.precast.WS['Scourge'] = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Scourge'].MaxAcc = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Scourge'].Max = set_combine(sets.precast.WS['Torcleaver'], {})
      
    sets.precast.WS['Torcleaver'] = {ammo="Knobkierrie",
    head="Sakpata's Helm",
    body="Ignominy Cuirass +3",
    hands="Sakpata's Gauntlets",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Torcleaver'].MaxAcc = set_combine(sets.precast.WS['Torcleaver'], {})
    sets.precast.WS['Torcleaver'].Max = set_combine(sets.precast.WS['Torcleaver'], {
        
    })
      
      
    sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, {left_ear="Kikou's earring"})
    sets.precast.WS['Scourge'].MaxAcc = set_combine(sets.precast.WS.MaxAcc, {left_ear="Kikou's earring"})
    sets.precast.WS['Scourge'].Max = set_combine(sets.precast.WS.Max, {left_ear="Kikou's earring"})
    --------------------------------------
    -- Midcast sets
    --------------------------------------
  
    sets.midcast.FastRecast = {}
          
    sets.midcast.Enmity = {}
  
    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})
      
    sets.midcast.Cure = {}
      
      
    sets.midcast['Dread Spikes'] = {
        ammo="Egoist's Tathlum",
    head="Sakpata's Helm",
    body="Heathen's Cuirass +1",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Bathy Choker +1",
    waist="Gold Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
      
      
    sets.midcast['Dark Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Sakpata's Helm",
        body={ name="Fall. Cuirass +3", augments={'Enhances "Blood Weapon" effect',}},
    hands="Sakpata's Gauntlets",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Sakpata's Leggings",
    neck="Erra Pendant",
    waist="Casso Sash",
    left_ear="Malignance Earring",
    right_ear="Dignitary's Earring",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. MaxAcc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
      
      
      sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {
        head="Ignominy Burgonet +2", -- 17
        -- neck="Sanctity Necklace",
        -- back="Niht Mantle",
        -- hands="Flamma Manopolas +2",
        back="Chuparrosa Mantle",
        hands="Pavor Gauntlets",
        ring1="Evanescence Ring", -- 10
        ring2="Kishar Ring",
    })
      
      
     -- Drain spells 
    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Fallen's Burgeonet +3",
        ear1="Malignance Earring",
        ear2="Hirudinea Earring",
        ring2="Excelsis Ring",
        feet="Ratri Sollerets +1"
    })
    sets.midcast.Aspir = sets.midcast.Drain
  
    sets.midcast.Drain.Acc = set_combine(sets.midcast.Drain, {
        hands="Leyline Gloves",
        waist="Eschan Stone", -- macc/matk 7
    })
    sets.midcast.Aspir.Acc = sets.midcast.Drain.Acc
      
      
      
      
    sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo Tathlum", 
        head="Ratri Sallet", -- 45 macc
        neck="Eddy Necklace", -- 11 matk
        ear1="Malignance Earring",
        ear2="Friomisi Earring", -- 10 matk
        body="Fallen's Cuirass +3",
        hands="Carmine Finger Gauntlets +1",
        ring1="Resonance Ring", -- int 8
        ring2="Regal Ring", -- matk 4
        waist="Eschan Stone", -- macc/matk 7
        legs="Eschite Cuisses", -- matk 25 
        back="Aput Mantle", -- mdmg 10
        feet="Founder's Greaves" -- matk 29
    }
  
  
   sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Dark Magic'], {
        ammo="Pemphredo Tathlum", 
        head="Befouled Crown",
        neck="Erra Pendant", -- 10 + 17 macc
        body="Ignominy Cuirass +3",
        hands="Flamma Manopolas +2",
        ring1="Kishar Ring",
        ring2="Regal Ring", -- 10 macc
        waist="Eschan Stone",
        legs="Fallen's Flanchard +3",  -- 18 + 39macc
        back="Aput Mantle",
        feet="Flamma Gambieras +2"
    })
      
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
  
     
      
  
    -- Idle sets
    sets.idle = {
        
    ammo="Staunch Tathlum +1",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Infused Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},

}
  
    sets.idle.Town = {
        ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Carmine Cuisses +1",
        feet="Sakpata's Leggings",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Infused Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},

}
  
    sets.idle.Field = set_combine(sets.idle, {
        
        
        ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Infused Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
})
    sets.idle.Regen = set_combine(sets.idle.Field, {})
      
    sets.idle.Weak = sets.idle
      
    sets.idle.Refresh = set_combine(sets.idle, {
   
    left_ring="Stikini Ring +1",
    })
  
    sets.idle.Sphere = set_combine(sets.idle, { body="Makora Meikogai"  })
  
    --------------------------------------
    -- Defense sets
    --------------------------------------
  
  
    -- Basic defense sets.
          
    sets.defense.PDT = {
        
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
    sets.defense.HP = {
        ammo="Coiste Bodhar",
        head="Hjarrandi Helm",
        body="Heath. Cuirass +1",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Tuisto Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Moonbeam Ring",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
}
  
      
    sets.defense.MDT = {
        head="Sulevia's mask +1",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Souveran cuirass",hands="Souveran handschuhs +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonbeam cape",waist="Gold Moogle Belt",legs="Souveran diechlings +1",feet="Souveran Schuhs +1"
    }
  
        sets.Kiting = {legs="Carmine Cuisses +1",
    }
    --------------------------------------
    -- Engaged sets
    --------------------------------------
      
    sets.engaged ={
        sub="Utu Grip",
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Vim Torque +1", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Telos Earring",
        right_ear="Schere Earring",
        left_ring="Fortified Ring",
        right_ring="Niqmaddu Ring",
        back="Atheling Mantle",
    }
  
    sets.engaged.STP = {
        ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Dedition Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring +1",
    back="Atheling Mantle",
}
  
    sets.engaged.MidAcc = {
        head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    right_ring="Moonbeam Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
}
      
    sets.engaged.MaxAcc = {
        ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Sulevia's Mask +2",
    body="Sulevia's Plate. +2",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','Weapon skill damage +10%',}},
}
      
      
    -- These only apply when delay is capped.
    sets.engaged.Haste = set_combine(sets.engaged, {
        waist="Windbuffet Belt +1"
    })
    sets.engaged.Haste.Mid = set_combine(sets.engaged.Mid, {
        waist="Windbuffet Belt +1"
    })
    sets.engaged.Haste.Acc = set_combine(sets.engaged.Acc, {})
  
      
      
  
    sets.engaged.Meva = {ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Brutal Earring",
    right_ear="Dedition Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
    sets.engaged.PDT = {ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
      
    sets.engaged.MidAcc.Meva = set_combine(sets.engaged.Meva, {})
    sets.engaged.MidAcc.PDT = {ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
      
    sets.engaged.MaxAcc.Meva = set_combine(sets.engaged.Meva, {})
    sets.engaged.MaxAcc.PDT = {ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
  
  
-- Liberator
    sets.engaged.Liberator = sets.engaged
    sets.engaged.Liberator.Mid = sets.engaged.Mid
    sets.engaged.Liberator.MaxAcc = set_combine(sets.engaged.MaxAcc, {
        body="Flamma Korazin +2",
    })
  
    -- Liberator AM3
    sets.engaged.Liberator.AM3 = set_combine(sets.engaged.Liberator, {
        ammo="Ginsen",
        head="Flamma Zucchetto +2",
        body="Hjarrandi Breast.",
        neck={ name="Vim Torque +1", augments={'Path: A',}},
        hands="Flamma Manopolas +2",
        ear1="Dedition Earring",
        ear2="Telos Earring",
        ring1="Niqmaddu Ring",
        right_ring="Chirich Ring +1",
        ---back=Ankou.STP,
        waist="Sailfi Belt +1",
        legs="Ig. Flanchard +3",
        feet="Flam. Gambieras +2",
    })
    sets.engaged.Liberator.MidAcc.AM3 = set_combine(sets.engaged.Liberator.AM3, {
        neck={ name="Vim Torque +1", augments={'Path: A',}},
        ear1="Cessance Earring",
        ---legs=Odyssean.Legs.TP,
    })
    sets.engaged.Liberator.MaxAcc.AM3 = set_combine(sets.engaged.Liberator.MidAcc.AM3, {
        ammo="Seething Bomblet +1",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        body="Flamma Korazin +2",
        ring2="Regal Ring",
        waist="Ioskeha Belt",
        legs="Ignominy Flanchard +3",
        feet="Flamma Gambieras +2"
    })
    sets.engaged.Haste.Liberator = set_combine(sets.engaged.Liberator, {
        waist="Windbuffet Belt +1"
    })
    sets.engaged.Haste.Liberator.MidAcc = set_combine(sets.engaged.Liberator.MidAcc, {
        waist="Windbuffet Belt +1"
    })
    sets.engaged.Haste.Liberator.MaxAcc = sets.engaged.Liberator.MaxAcc
      
    sets.engaged.Haste.Liberator.AM3 = set_combine(sets.engaged.Liberator.AM3, {
        waist="Windbuffet Belt +1",
        legs="Sulevia's Cuisses +2" 
    })
    sets.engaged.Haste.Liberator.MidAcc.AM3 = sets.engaged.Liberator.MidAcc.AM3
    sets.engaged.Haste.Liberator.MaxAcc.AM3 = sets.engaged.Liberator.MaxAcc.AM3
      
    -- Hybrid
    sets.engaged.Liberator.PDT = set_combine(sets.engaged.Liberator, {ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
} )
    sets.engaged.Liberator.MidAcc.PDT = set_combine(sets.engaged.Liberator.PDT, {
        ear1="Cessance Earring",
    })
    sets.engaged.Liberator.MaxAcc.PDT = set_combine(sets.engaged.Liberator.MaxAcc, sets.DefensiveHigh)
    -- Hybrid with AM3 up
    sets.engaged.Liberator.PDT.AM3 = set_combine(sets.engaged.Liberator.AM3, sets.Defensive)
    sets.engaged.Liberator.MidAcc.PDT.AM3 = set_combine(sets.engaged.Liberator.MidAcc.AM3, sets.Defensive_Mid)
    sets.engaged.Liberator.MaxAcc.PDT.AM3 = set_combine(sets.engaged.Liberator.MaxAcc.AM3, sets.DefensiveHigh)
    -- Hybrid with capped delay
    sets.engaged.Haste.Liberator.PDT = set_combine(sets.engaged.Liberator.PDT, sets.DefensiveHigh)
    sets.engaged.Haste.Liberator.MidAcc.PDT = set_combine(sets.engaged.Liberator.MidAcc.PDT, sets.DefensiveHigh)
    sets.engaged.Haste.Liberator.MaxAcc.PDT = set_combine(sets.engaged.Liberator.MaxAcc.PDT, sets.DefensiveHigh)
    -- Hybrid with capped delay + AM3 up
    sets.engaged.Haste.Liberator.PDT.AM3 = set_combine(sets.engaged.Liberator.PDT.AM3, sets.Defensive)
    sets.engaged.Haste.Liberator.MidAcc.PDT.AM3 = set_combine(sets.engaged.Liberator.MidAcc.PDT.AM3, sets.Defensive_Mid)
    sets.engaged.Haste.Liberator.MaxAcc.PDT.AM3 = set_combine(sets.engaged.Liberator.MaxAcc.PDT.AM3, sets.DefensiveHigh)
  
    -- Apocalypse
    sets.engaged.Apocalypse = set_combine(sets.engaged, {
       
    })
    sets.engaged.Apocalypse.MidAcc = set_combine(sets.engaged.MidAcc, {
    
    })
    sets.engaged.Apocalypse.MaxAcc = set_combine(sets.engaged.MaxAcc, {
 
    })
      
    -- sets.engaged.Apocalypse.AM = set_combine(sets.engaged.Apocalypse, {})
    -- sets.engaged.Apocalypse.MidAcc.AM = set_combine(sets.engaged.Apocalypse.AM, {})
    -- sets.engaged.Apocalypse.MaxAcc.AM = set_combine(sets.engaged.Apocalypse.MidAcc.AM, {
    --     ring2="Cacoethic Ring +1",
    --     waist="Ioskeha Belt"
    -- })
    sets.engaged.Haste.Apocalypse = set_combine(sets.engaged.Apocalypse, {
        waist="Windbuffet Belt +1"
    })
    sets.engaged.Haste.Apocalypse.MidAcc = sets.engaged.Apocalypse.MidAcc
    sets.engaged.Haste.Apocalypse.MaxAcc = sets.engaged.Apocalypse.MaxAcc
  
    -- Hybrid
    sets.engaged.Apocalypse.PDT = {ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
         
    sets.engaged.Apocalypse.MidAcc.PDT = set_combine(sets.engaged.Apocalypse.MidAcc, sets.Defensive_Mid)
    sets.engaged.Apocalypse.MaxAcc.PDT = set_combine(sets.engaged.Apocalypse.MaxAcc, sets.Defensive_MaxAcc)
    -- Hybrid with relic AM 
    -- sets.engaged.Apocalypse.PDT.AM = set_combine(sets.engaged.Apocalypse, sets.Defensive)
    -- sets.engaged.Apocalypse.MidAcc.PDT.AM = set_combine(sets.engaged.Apocalypse.MidAcc, sets.Defensive_Mid)
    -- sets.engaged.Apocalypse.MaxAcc.PDT.AM = set_combine(sets.engaged.Apocalypse.MaxAcc, sets.Defensive_MaxAcc)
    -- Hybrid with capped delay
    sets.engaged.Haste.Apocalypse.PDT = sets.engaged.PDT
    sets.engaged.Haste.Apocalypse.MidAcc.PDT = set_combine(sets.engaged.Apocalypse.MidAcc.PDT, sets.DefensiveHigh)
    sets.engaged.Haste.Apocalypse.MaxAcc.PDT = set_combine(sets.engaged.Apocalypse.MaxAcc.PDT, sets.DefensiveHigh)
    -- Hybrid with capped delay + AM3 up
    -- sets.engaged.Haste.Apocalypse.PDT.AM3 = set_combine(sets.engaged.Apocalypse.PDT.AM3, sets.DefensiveHigh)
    -- sets.engaged.Haste.Apocalypse.Mid.PDT.AM3 = set_combine(sets.engaged.Apocalypse.Mid.PDT.AM3, sets.DefensiveHigh)
    -- sets.engaged.Haste.Apocalypse.MaxAcc.PDT.AM3 = set_combine(sets.engaged.Apocalypse.MaxAcc.PDT.AM3, sets.DefensiveHigh)
      
        -- generic great sword
    sets.engaged.GreatSword = set_combine(sets.engaged, {
       
    })
    sets.engaged.GreatSword.Mid = set_combine(sets.engaged.Mid, {})
    sets.engaged.GreatSword.Acc = set_combine(sets.engaged.Acc, {
       
       
    })
  
    sets.engaged.GreatSword.PDT = ({ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Brutal Earring",
    right_ear="Dedition Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
})
    sets.engaged.GreatSword.Mid.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
    sets.engaged.GreatSword.Acc.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
  
    sets.engaged.Haste.GreatSword = set_combine(sets.engaged.Haste, {})
    sets.engaged.Haste.GreatSword.Mid = set_combine(sets.engaged.Haste.Mid, {})
    sets.engaged.Haste.GreatSword.Acc = set_combine(sets.engaged.Haste.Acc, {})
  
    sets.engaged.Haste.GreatSword.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
    sets.engaged.Haste.GreatSword.Mid.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
    sets.engaged.Haste.GreatSword.Acc.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
      
    -- Ragnarok
    sets.engaged.Ragnarok = set_combine(sets.engaged.GreatSword, {})
    sets.engaged.Ragnarok.MidAcc = set_combine(sets.engaged.GreatSword.MidAcc, {})
    sets.engaged.Ragnarok.MaxAcc = set_combine(sets.engaged.GreatSword.MaxAcc, {})
      
    sets.engaged.Ragnarok.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
    sets.engaged.Ragnarok.MidAcc.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
    sets.engaged.Ragnarok.MaxAcc.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
      
    -- Caladbolg
    sets.engaged.Caladbolg = set_combine(sets.engaged.GreatSword, {
    })
    sets.engaged.Caladbolg.MidAcc = set_combine(sets.engaged.GreatSword.MidAcc, {
    })
    sets.engaged.Caladbolg.MaxAcc = set_combine(sets.engaged.GreatSword.MaxAcc, {
    })
      
    sets.engaged.Caladbolg.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
    sets.engaged.Caladbolg.MidAcc.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
    sets.engaged.Caladbolg.MaxAcc.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
      
    sets.engaged.Haste.Caladbolg = set_combine(sets.engaged.Caladbolg, { 
        waist="Windbuffet Belt +1"
    })
    sets.engaged.Haste.Caladbolg.MidAcc = set_combine(sets.engaged.Caladbolg.MidAcc, {
        hands="Sulevia's Gauntlets +2",
        waist="Windbuffet Belt +1"
    })
    sets.engaged.Haste.Caladbolg.MaxAcc = set_combine(sets.engaged.Caladbolg.MaxAcc, {
        hands="Sulevia's Gauntlets +2",
    })
  
    sets.engaged.Haste.Caladbolg.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
    sets.engaged.Haste.Caladbolg.MidAcc.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
    sets.engaged.Haste.Caladbolg.MaxAcc.PDT = set_combine(sets.engaged.GreatSword.PDT, {})
      
  
end
  
  
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type:endswith('Magic') and buffactive.silence then
        eventArgs.cancel = true
        send_command('input /item "Echo Drops" <me>')
    end
end
  
  
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        if world.time >= 17*60 or world.time < 7*60 and player.tp > 2600 then -- Dusk to Dawn time.
            equip({ear1="Lugra Earring +1", ear2="Thrud Earring"})
        end
        if world.time >= 17*60 or world.time < 7*60 then
            equip({ear2="Thrud Earring"})
        end
            if player.tp > 2700 then
            equip({ear1="Lugra Earring +1"})
        end 
    end
end
  
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type:endswith('Magic') and buffactive.silence then
        eventArgs.cancel = true
        send_command('input /item "Echo Drops" <me>')
    end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    aw_custom_aftermath_timers_precast(spell)
end
  
  
  
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
end
  
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.english:startswith('Drain') then
        if player.status == 'Engaged' and state.CastingMode.current == 'Normal' and player.hpp < 70 then
            classes.CustomClass = 'OhShit'
        end
    end
  
    if (state.HybridMode.current == 'PDT' and state.PhysicalDefenseMode.current == 'Reraise') then
        equip(sets.Reraise)
    end
end
  
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    aw_custom_aftermath_timers_aftercast(spell)
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
    end
end
  
function job_post_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        if state.Buff.Souleater and state.SouleaterMode.value then
            send_command('@wait 1.0;cancel souleater')
            --enable("head")
        end
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)
end
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.hpp < 50 then
        idleSet = set_combine(idleSet, sets.idle.Regen)
    elseif player.mpp < 50 then
        idleSet = set_combine(idleSet, sets.idle.Refresh)
    end
    if state.IdleMode.current == 'Sphere' then
        idleSet = set_combine(idleSet, sets.idle.Sphere)
    end
    if state.HybridMode.current == 'PDT' then
        idleSet = set_combine(idleSet, sets.defense.PDT)
    end
    return idleSet
end
  
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
    if state.Buff['Souleater'] then
        meleeSet = set_combine(meleeSet, sets.buff.Souleater)
    end
    --meleeSet = set_combine(meleeSet, select_earring())
    return meleeSet
end
  
-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
  
-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == "Engaged" then
        --if state.Buff['Last Resort'] then
        --    send_command('@wait 1.0;cancel hasso')
        --end
        -- handle weapon sets
    if remaWeapons:contains(player.equipment.main) then
        state.CombatWeapon:set(player.equipment.main)
    end
        -- if gsList:contains(player.equipment.main) then
        --     state.CombatWeapon:set("GreatSword")
        -- elseif scytheList:contains(player.equipment.main) then
        --     state.CombatWeapon:set("Scythe")
        -- elseif remaWeapons:contains(player.equipment.main) then
        --     state.CombatWeapon:set(player.equipment.main)
        -- else -- use regular set, which caters to Liberator
        --     state.CombatWeapon:reset()
        -- end
        --elseif newStatus == 'Idle' then
        --    determine_idle_group()
    end
end
  
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
  
    if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
  
    if S{'madrigal'}:contains(buff:lower()) then
        if buffactive.madrigal and state.OffenseMode.value == 'MaxAcc' then
            equip(sets.MadrigalBonus)
        end
    end
    if S{'haste', 'march', 'embrava', 'geo-haste', 'indi-haste', 'last resort'}:contains(buff:lower()) then
        if (buffactive['Last Resort']) then
            if (buffactive.embrava or buffactive.haste) and buffactive.march then
                state.CombatForm:set("Haste")
                if not midaction() then
                    handle_equipping_gear(player.status)
                end
            end
        else
            if state.CombatForm.current ~= 'DW' and state.CombatForm.current ~= 'SW' then
                state.CombatForm:reset()
            end
            if not midaction() then
                handle_equipping_gear(player.status)
            end
        end
    end
    -- Drain II/III HP Boost. Set SE to stay on.
    -- if buff == "Max HP Boost" and state.SouleaterMode.value then
    --     if gain or buffactive['Max HP Boost'] then
    --         state.SouleaterMode:set(false)
    --     else
    --         state.SouleaterMode:set(true)
    --     end
    -- end
    -- Make sure SE stays on for BW
    if buff == 'Blood Weapon' and state.SouleaterMode.value then
        if gain or buffactive['Blood Weapon'] then
            state.SouleaterMode:set(false)
        else
            state.SouleaterMode:set(true)
        end
    end
    -- AM custom groups
    if buff:startswith('Aftermath') then
        if player.equipment.main == 'Liberator' then
            classes.CustomMeleeGroups:clear()
  
            if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
                classes.CustomMeleeGroups:append('AM3')
                add_to_chat(8, '-------------Mythic AM3 UP-------------')
            -- elseif (buff == "Aftermath: Lv.3" and not gain) then
            --     add_to_chat(8, '-------------Mythic AM3 DOWN-------------')
            end
  
            if not midaction() then
                handle_equipping_gear(player.status)
            end
        else
            classes.CustomMeleeGroups:clear()
  
            if buff == "Aftermath" and gain or buffactive.Aftermath then
                classes.CustomMeleeGroups:append('AM')
            end
  
            if not midaction() then
                handle_equipping_gear(player.status)
            end
        end
    end
      
    -- if  buff == "Samurai Roll" then
    --     classes.CustomRangedGroups:clear()
    --     if (buff == "Samurai Roll" and gain) or buffactive['Samurai Roll'] then
    --         classes.CustomRangedGroups:append('SamRoll')
    --     end
         
    -- end
  
    --if buff == "Last Resort" then
    --    if gain then
    --        send_command('@wait 1.0;cancel hasso')
    --    else
    --        if not midaction() then
    --            send_command('@wait 1.0;input /ja "Hasso" <me>')
    --        end
    --    end
    --end
end
  
  
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
  
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
  
    war_sj = player.sub_job == 'WAR' or false
    get_combat_form()
    get_combat_weapon()
    update_melee_groups()
    select_default_macro_book()
end
  
-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end
-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
--function th_action_check(category, param)
--    if category == 2 or -- any ranged attack
--        --category == 4 or -- any magic action
--        (category == 3 and param == 30) or -- Aeolian Edge
--        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
--        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
--        then 
--            return true
--    end
--end
-- function get_custom_wsmode(spell, spellMap, default_wsmode)
--     if state.OffenseMode.current == 'Mid' then
--         if buffactive['Aftermath: Lv.3'] then
--             return 'AM3Mid'
--         end
--     elseif state.OffenseMode.current == 'MaxAcc' then
--         if buffactive['Aftermath: Lv.3'] then
--             return 'AM3MaxAcc'
--         end
--     else
--         if buffactive['Aftermath: Lv.3'] then
--             return 'AM3'
--         end
--     end
-- end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function get_combat_form()
  
    if S{'NIN', 'DNC'}:contains(player.sub_job) and swordList:contains(player.equipment.main) then
        state.CombatForm:set("DW")
    --elseif player.equipment.sub == '' or shields:contains(player.equipment.sub) then
    elseif swordList:contains(player.equipment.main) then
        state.CombatForm:set("SW")
    elseif buffactive['Last Resort'] then
        if (buffactive.embrava or buffactive.haste) and buffactive.march then
            add_to_chat(8, '-------------Delay Capped-------------')
            state.CombatForm:set("Haste")
        else
            state.CombatForm:reset()
        end
    else
        state.CombatForm:reset()
    end
end
  
function get_combat_weapon()
    state.CombatWeapon:reset()
    if remaWeapons:contains(player.equipment.main) then
        state.CombatWeapon:set(player.equipment.main)
    end
    -- if remaWeapons:contains(player.equipment.main) then
    --     state.CombatWeapon:set(player.equipment.main)
    -- elseif gsList:contains(player.equipment.main) then
    --     state.CombatWeapon:set("GreatSword")
    -- elseif scytheList:contains(player.equipment.main) then
    --     state.CombatWeapon:set("Scythe")
    -- end
end
  
function aw_custom_aftermath_timers_precast(spell)
    if spell.type == 'WeaponSkill' then
        info.aftermath = {}
  
        local mythic_ws = "Insurgency"
  
        info.aftermath.weaponskill = mythic_ws
        info.aftermath.duration = 0
  
        info.aftermath.level = math.floor(player.tp / 1000)
        if info.aftermath.level == 0 then
            info.aftermath.level = 1
        end
  
        if spell.english == mythic_ws and player.equipment.main == 'Liberator' then
            -- nothing can overwrite lvl 3
            if buffactive['Aftermath: Lv.3'] then
                return
            end
            -- only lvl 3 can overwrite lvl 2
            if info.aftermath.level ~= 3 and buffactive['Aftermath: Lv.2'] then
                return
            end
  
            if info.aftermath.level == 1 then
                info.aftermath.duration = 90
            elseif info.aftermath.level == 2 then
                info.aftermath.duration = 120
            else
                info.aftermath.duration = 180
            end
        end
    end
end
  
-- Call from job_aftercast() to create the custom aftermath timer.
function aw_custom_aftermath_timers_aftercast(spell)
    if not spell.interrupted and spell.type == 'WeaponSkill' and
        info.aftermath and info.aftermath.weaponskill == spell.english and info.aftermath.duration > 0 then
  
        local aftermath_name = 'Aftermath: Lv.'..tostring(info.aftermath.level)
        send_command('timers d "Aftermath: Lv.1"')
        send_command('timers d "Aftermath: Lv.2"')
        send_command('timers d "Aftermath: Lv.3"')
        send_command('timers c "'..aftermath_name..'" '..tostring(info.aftermath.duration)..' down abilities/aftermath'..tostring(info.aftermath.level)..'.png')
  
        info.aftermath = {}
    end
end
  
function display_current_job_state(eventArgs)
    local msg = ''
    msg = msg .. 'Offense: '..state.OffenseMode.current
    msg = msg .. ', Hybrid: '..state.HybridMode.current
  
    if state.DefenseMode.value ~= 'None' then
        local defMode = state[state.DefenseMode.value ..'DefenseMode'].current
        msg = msg .. ', Defense: '..state.DefenseMode.value..' '..defMode
    end
    if state.CombatForm.current ~= '' then 
        msg = msg .. ', Form: ' .. state.CombatForm.current 
    end
    if state.CombatWeapon.current ~= '' then 
        msg = msg .. ', Weapon: ' .. state.CombatWeapon.current 
    end
    if state.CapacityMode.value then
        msg = msg .. ', Capacity: ON, '
    end
    if state.SouleaterMode.value then
        msg = msg .. ', SE Cancel, '
    end
    -- if state.LastResortMode.value then
    --     msg = msg .. ', LR Defense, '
    -- end
    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end
    if state.SelectNPCTargets.value then
        msg = msg .. ', Target NPCs'
    end
  
    add_to_chat(123, msg)
    eventArgs.handled = true
end
  
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
end
  
-- Creating a custom spellMap, since Mote capitalized absorbs incorrectly
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Dark Magic' and absorbs:contains(spell.english) then
        return 'Absorb'
    end
    -- if spell.type == 'Trust' then
    --     return 'Trust'
    -- end
end
  
  
function update_melee_groups()
  
    classes.CustomMeleeGroups:clear()
    -- mythic AM    
    if player.equipment.main == 'Liberator' then
        if buffactive['Aftermath: Lv.3'] then
            classes.CustomMeleeGroups:append('AM3')
        end
    else
        -- relic AM
        if buffactive['Aftermath'] then
            classes.CustomMeleeGroups:append('AM')
        end
        -- if buffactive['Samurai Roll'] then
        --     classes.CustomRangedGroups:append('SamRoll')
        -- end
    end
end
  
function select_default_macro_book()
      
    if scytheList:contains(player.equipment.main) then
        set_macro_page(7, 2)
    elseif gsList:contains(player.equipment.main) then
        set_macro_page(7, 2)
    elseif player.sub_job == 'SAM' then
        set_macro_page(7, 2)
    else
        set_macro_page(7, 2)
    end
end
  
function update_combat_form()
  
end