--[[
    Lv1
        溶解(Liquefacrion)  土,雷->火
        硬化(Induration)    水->氷
        炸裂(Detonation)    土,雷,闇->風
        切断(Scission)      火,風->土
        衝撃(Impaction)     氷,水->雷
        振動(Reverberation) 土,光->水
        貫通(Transfixion)   闇->光
        収縮(Compression)   氷,光->闇
    Lv2
        核熱(Fusion)        火->雷
        重力(Gravitation)   風->闇
        分解(Fragmentation) 氷->水
        湾曲(Distortion)    光->土
]]

return {
    English = {
		['6step'] = {
            ['open'] = {
                ['ele'] = 'Aero',
                ['hel'] = 'Geohelix',
            },
            ['close'] = {
                ['ele'] = 'Stone',
                ['hel'] = 'Pyrohelix',
            },
            ['close2'] = {
                ['ele'] = 'Aero',
                ['hel'] = 'Pyrohelix',
            },
			['close3'] = {
                ['ele'] = 'Stone',
                ['hel'] = 'Pyrohelix',
            },
			['close4'] = {
                ['ele'] = 'Aero',
                ['hel'] = 'Pyrohelix',
            },
			['close5'] = {
                ['ele'] = 'Stone',
                ['hel'] = 'Pyrohelix',
            },
			['close6'] = {
                ['ele'] = 'Aero',
                ['hel'] = 'Pyrohelix',
            },
            ['at'] = {
                ['sc_name'] = '',
                ['sc_ele'] = {'',},
            },
        },
        ['fire'] = {
            ['open'] = {
                ['ele'] = 'Stone',
                ['hel'] = 'Geohelix',
            },
            ['close'] = {
                ['ele'] = 'Fire',
                ['hel'] = 'Pyrohelix',
            },
            ['mb'] = {
                ['ele'] = 'Fire',
                ['hel'] = 'Pyrohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Liquefaction',
                ['sc_ele'] = {'Fire',},
            },
        },
        ['blizzard'] = {
            ['open'] = {
                ['ele'] = 'Water',
                ['hel'] = 'Hydrohelix',
            },
            ['close'] ={
                ['ele'] = 'Blizzard',
                ['hel'] = 'Cryohelix',
            },
            ['mb'] ={
                ['ele'] = 'Blizzard',
                ['hel'] = 'Cryohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Detonation',
                ['sc_ele'] = {'Stone',},
            },
        },
        ['aero'] = {
            ['open'] = {
                ['ele'] = 'Stone',
                ['hel'] = 'Geohelix',
            },
            ['close'] = {
                ['ele'] = 'Aero',
                ['hel'] = 'Anemohelix',
            },
            ['mb'] = {
                ['ele'] = 'Aero',
                ['hel'] = 'Anemohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Detonation',
                ['sc_ele'] = {'wind',},
            },
        },
        ['stone'] = {
            ['open'] = {
                ['ele'] = 'Fire',
                ['hel'] = 'Pyrohelix',
            },
            ['close'] = {
                ['ele'] = 'Stone',
                ['hel'] = 'Geohelix',
            },
            ['mb'] = {
                ['ele'] = 'Stone',
                ['hel'] = 'Geohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Scission',
                ['sc_ele'] = {'earth',},
            },
        },
        ['thunder'] = {
            ['open'] = {
                ['ele'] = 'Blizzard',
                ['hel'] = 'Cryohelix',
            },
            ['close'] = {
                ['ele'] = 'Thunder',
                ['hel'] = 'Ionohelix',
            },
            ['mb'] = {
                ['ele'] = 'Thunder',
                ['hel'] = 'Ionohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Impaction',
                ['sc_ele'] = {'Thunder',},
            },
        },
        ['water'] = {
            ['open'] = {
                ['ele'] = 'Stone',
                ['hel'] = 'Geohelix',
            },
            ['close'] = {
                ['ele'] = 'Water',
                ['hel'] = 'Hydrohelix',
            },
            ['mb'] = {
                ['ele'] = 'Water',
                ['hel'] = 'Hydrohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Reverberation',
                ['sc_ele'] = {'Water',},
            },
        },
        ['light'] = {
            ['open'] = {
                ['ele'] = nil,
                ['hel'] = 'Noctohelix',
            },
            ['close'] = {
                ['ele'] = nil,
                ['hel'] = 'Luminohelix',
            },
            ['mb'] = {
                ['ele'] = nil,
                ['hel'] = 'Luminohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Transfixion',
                ['sc_ele'] = {'Light',},
            },
        },
        ['dark'] = {
            ['open'] = {
                ['ele'] = 'Blizzard',
                ['hel'] = 'Cryohelix',
            },
            ['close'] = {
                ['ele'] = nil,
                ['hel'] = 'Noctohelix',
            },
            ['mb'] = {
                ['ele'] = nil,
                ['hel'] = 'Noctohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Compression',
                ['sc_ele'] = {'Darkness',},
            },
        },
        ['fire2'] = {
            ['open'] = {
                ['ele'] = 'Fire',
                ['hel'] = 'Pyrohelix',
            },
            ['close'] = {
                ['ele'] = 'Thunder',
                ['hel'] = 'Ionohelix',
            },
            ['mb'] = {
                ['ele'] = 'Fire',
                ['hel'] = 'Pyrohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Fusion',
                ['sc_ele'] = {'Fire','Light',},
            },
        },
        ['blizzard2'] = {
            ['open'] = {
                ['ele'] = nil,
                ['hel'] = 'Luminohelix',
            },
            ['close'] ={
                ['ele'] = 'Stone',
                ['hel'] = 'Geohelix',
            },
            ['mb'] = {
                ['ele'] = 'Blizzard',
                ['hel'] = 'Cryohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Detonation',
                ['sc_ele'] = {'ice','water',},
            },
        },
        ['aero2'] = {
            ['open'] = {
                ['ele'] = 'Blizzard',
                ['hel'] = 'Cryohelix',
            },
            ['close'] = {
                ['ele'] = 'Water',
                ['hel'] = 'Hydrohelix',
            },
            ['mb'] = {
                ['ele'] = 'Aero',
                ['hel'] = 'Anemohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Fragmentation',
                ['sc_ele'] = {'Thunder','wind',},
            },
        },
        ['stone2'] = {
            ['open'] = {
                ['ele'] = 'Aero',
                ['hel'] = 'Anemohelix',
            },
            ['close'] = {
                ['ele'] = nil,
                ['hel'] = 'Noctohelix',
            },
            ['mb'] ={
                ['ele'] = 'Stone',
                ['hel'] = 'Geohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Gravitation',
                ['sc_ele'] = {'earth','Darkness',},
            },
        },
        ['thunder2'] = {
            ['open'] = {
                ['ele'] = 'Blizzard',
                ['hel'] = 'Cryohelix',
            },
            ['close'] = {
                ['ele'] = 'Water',
                ['hel'] = 'Hydrohelix',
            },
            ['mb'] = {
                ['ele'] = 'Thunder',
                ['hel'] = 'Ionohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Fragmentation',
                ['sc_ele'] = {'Thunder','wind',},
            },
        },
        ['water2'] = {
            ['open'] = {
                ['ele'] = nil,
                ['hel'] = 'Luminohelix',
            },
            ['close'] ={
                ['ele'] = 'Stone',
                ['hel'] = 'Geohelix',
            },
            ['mb'] = {
                ['ele'] = 'Water',
                ['hel'] = 'Hydrohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Distortion',
                ['sc_ele'] = {'ice','water',},
            },
        },
        ['light2'] = {
            ['open'] = {
                ['ele'] = 'Fire',
                ['hel'] = 'Pyrohelix',
            },
            ['close'] = {
                ['ele'] = 'Thunder',
                ['hel'] = 'Ionohelix',
            },
            ['mb'] = {
                ['ele'] = nil,
                ['hel'] = 'Luminohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Fusion',
                ['sc_ele'] = {'Fire','Light',},
            },
        },
        ['dark2'] = {
            ['open'] = {
                ['ele'] = 'Aero',
                ['hel'] = 'Anemohelix',
            },
            ['close'] = {
                ['ele'] = nil,
                ['hel'] = 'Noctohelix',
            },
            ['mb'] = {
                ['ele'] = nil,
                ['hel'] = 'Noctohelix',
            },
            ['at'] = {
                ['sc_name'] = 'Gravitation',
                ['sc_ele'] = {'earth','Darkness',},
            },
        },
    },
}