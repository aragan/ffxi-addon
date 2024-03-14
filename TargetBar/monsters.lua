-- http://ff11db.sakura.ne.jp/database/
-- http://ff11.s288.xrea.com/
-- タイプ 0=ノンアク・1=アク・2=ノンアク&リンク・3=アク&リンク・4=条件アク・5=条件アク&リンク


-- モンスター
local Nms =
{
	-----------------------------------------------------------
	-- ノーマルモンスター

	-- アーリマン族
	[ "Ahriman"					] = { 3 },	-- Fix
	[ "Bat Eye"					] = { 1 },	-- Fix
	[ "Deadly Iris"				] = { 3 },	-- Fix
	[ "Evil Eye"				] = { { [   0 ] = 3, [ 112 ] = 1 } },	-- Fix
	[ "Fachan"					] = { 1 },	-- Fix
	[ "Floating Eye"			] = { 1 },	-- Fix
	[ "Hovering Oculus"			] = { 1 },	-- Fix
	[ "Morbid Eye"				] = { 3 },	-- Fix
	[ "Smolenkos"				] = { 1 },	-- Fix

	-- アーン族
	[ "Aw'aern"					] = { 2 },	-- Fix
	[ "Eo'aern"					] = { 2 },	-- Fix
	[ "Ul'aern"					] = { 2 },	-- Fix
	[ "Om'aern"					] = { 2 },	-- Fix

	-- アダマンタス族

	-- アプカル族

	-- アルテマ族

	-- アンティカ族
	[ "Antican Aedilis"			] = { 3 },	-- Fix
	[ "Antican Antesignanus"	] = { 3 },	-- Fix
	[ "Antican Auxiliarius"		] = { 3 },	-- Fix
	[ "Antican Centurio"		] = { 3 },	-- Fix
	[ "Antican Decurio"			] = { 3 },	-- Fix
	[ "Antican Eques"			] = { 3 },	-- Fix
	[ "Antican Faber"			] = { 3 },	-- Fix
	[ "Antican Funditor"		] = { 3 },	-- Fix
	[ "Antican Essedarius"		] = { 3 },	-- Fix
	[ "Antican Hastatus"		] = { 3 },	-- Fix
	[ "Antican Hoplomachus"		] = { 3 },	-- Fix
	[ "Antican Lanista"			] = { 3 },	-- Fix
	[ "Antican Princeps"		] = { 3 },	-- Fix
	[ "Antican Quaestor"		] = { 3 },	-- Fix
	[ "Antican Retiarius"		] = { 3 },	-- Fix
	[ "Antican Sagittarius"		] = { 3 },	-- Fix
	[ "Antican Secutor"			] = { 3 },	-- Fix
	[ "Antican Signifer"		] = { 3 },	-- Fix
	[ "Antican Speculator"		] = { 3 },	-- Fix
	[ "Antican Triarius"		] = { 3 },	-- Fix
	[ "Antican Veles"			] = { 3 },	-- Fix

	-- アントリオン族
	[ "Burrow Antlion"			] = { 1 },	-- Fix
	[ "Cave Antlion"			] = { 1 },	-- Fix
	[ "Hunter Antlion"			] = { 2 },	-- Fix
	[ "Pit Antlion"				] = { 1 },	-- Fix
	[ "Tracer Antlion"			] = { 2 },	-- Fix
	[ "Tracker Antlion"			] = { 2 },	-- Fix
	[ "Trench Antlion"			] = { 1 },	-- Fix

	-- イビルウェポン族
	[ "Aura Weapon"				] = { 1 },	-- Fix
	[ "Apocalyptic Weapon"		] = { 3 },	-- Fix
	[ "Boggart"					] = { 1 },	-- Fix
	[ "Cursed Weapon"			] = { 1 },	-- Fix
	[ "Dancing Weapon"			] = { 1 },	-- Fix
	[ "Decorative Weapon"		] = { 1 },	-- Fix
	[ "Demonic Weapon"			] = { 1 },	-- Fix
	[ "Evil Weapon"				] = { 1 },	-- Fix
	[ "Hellish Weapon"			] = { 1 },	-- Fix
	[ "Infernal Weapon"			] = { 3 },	-- Fix
	[ "Killing Weapon"			] = { { [   0 ] = 1, [ 122 ] = 3 } },	-- Fix
	[ "Mystic Weapon"			] = { 1 },	-- Fix
	[ "Ominous Weapon"			] = { 3 },	-- Fix
	[ "Ornamental Weapon"		] = { 1 },	-- Fix
	[ "Over Weapon"				] = { 1 },	-- Fix
	[ "Poltergeist"				] = { 1 },	-- Fix
	[ "Vault Weapon"			] = { 1 },	-- Fix

	-- インプ族

	-- ウィーバー族
	[ "Weeper"					] = { 1 },	-- Fix

	-- ウィヴル族

	-- ウィナフ族

	-- ウィルム族

	-- ウサギ族
	[ "Blood Bunny"				] = { 2 },	-- Fix
	[ "Beach Bunny"				] = { 2 },	-- Fix
	[ "Bog Bunny"				] = { 2 },	-- Fix
	[ "Canyon Rarab"			] = { 2 },	-- Fix
	[ "Forest Hare"				] = { { [   0 ] = 0, [  81 ] = 2 } },	-- Fix
	[ "Goblin's Rabbit"			] = { 0 },	-- Fix
	[ "Goblin's Rarab"			] = { 0 },	-- Fix
	[ "Hoarder Hare"			] = { 2 },	-- Fix
	[ "Island Rarab"			] = { 2 },	-- Fix
	[ "Mighty Rarab"			] = { 2 },	-- Fix
	[ "Moss Eater"				] = { 2 },	-- Fix
	[ "Pit Hare"				] = { 2 },	-- Fix
	[ "Polar Hare"				] = { 0 },	-- Fix
	[ "Rabid Rat"				] = { 2 },	-- Fix
	[ "Sand Hare"				] = { 2 },	-- Fix
	[ "Savanna Rarab"			] = { 0 },	-- Fix
	[ "Steppe Hare"				] = { 2 },	-- Fix
	[ "Tropical Rarab"			] = { 2 },	-- Fix
	[ "Variable Hare"			] = { 0 },	-- Fix
	[ "Vorpal Bunny"			] = { 2 },	-- Fix
	[ "Wadi Hare"				] = { 2 },	-- Fix
	[ "Wild Rabbit"				] = { 0 },	-- Fix

	-- ウラグナイト族
	[ "Coralline Uragnite"		] = { 0 },	-- Fix
	[ "Uragnite"				] = { 0 },	-- Fix

	-- エフト族
	[ "Eft"						] = { 2 },	-- Fix
	[ "Hypnos Eft"				] = { 2 },	-- Fix
	[ "Tartarus Eft"			] = { 2 },	-- Fix

	-- エレメンタル族
	[ "Aern's Elemental"		] = { 0 },	-- Fix
	[ "Air Elemental"			] = { 4 },	-- Fix
	[ "Dark Elemental"			] = { 4 },	-- Fix
	[ "Demon's Elemental"		] = { 0 },	-- Fix
	[ "Earth Elemental"			] = { 4 },	-- Fix
	[ "Fire Elemental"			] = { 4 },	-- Fix
	[ "Fomor's Elemental"		] = { 0 },	-- Fix
	[ "Ice Elemental"			] = { 4 },	-- Fix
	[ "Light Elemental"			] = { 4 },	-- Fix
	[ "Thunder Elemental"		] = { 4 },	-- Fix
	[ "Tonberry's Elemental"	] = { 0 },	-- Fix
	[ "Water Elemental"			] = { 4 },	-- Fix
	[ "Yagudo's Elemental"		] = { 0 },	-- Fix

	-- オーク族
	[ "Orcish Beastrider"		] = { 3 },	-- Fix
	[ "Orcish Bowshooter"		] = { 3 },	-- Fix
	[ "Orcish Brawler"			] = { 3 },	-- Fix
	[ "Orcish Champion"			] = { 3 },	-- Fix
	[ "Orcish Cursemaker"		] = { 3 },	-- Fix
	[ "Orcish Dragoon"			] = { 3 },	-- Fix
	[ "Orcish Dreadnought"		] = { 3 },	-- Fix
	[ "Orcish Farkiller"		] = { 3 },	-- Fix
	[ "Orcish Fighter"			] = { 3 },	-- Fix
	[ "Orcish Fodder"			] = { 3 },	-- Fix
	[ "Orcish Footsoldier"		] = { 3 },	-- Fix
	[ "Orcish Gladiator"		] = { 3 },	-- Fix
	[ "Orcish Grappler"			] = { 3 },	-- Fix
	[ "Orcish Grunt"			] = { 3 },	-- Fix
	[ "Orcish Impaler"			] = { 3 },	-- Fix
	[ "Orcish Mesmerizer"		] = { 3 },	-- Fix
	[ "Orcish Neckchopper"		] = { 3 },	-- Fix
	[ "Orcish Nightraider"		] = { 3 },	-- Fix
	[ "Orcish Predator"			] = { 3 },	-- Fix
	[ "Orcish Protector"		] = { 3 },	-- Fix
	[ "Orcish Serjeant"			] = { 3 },	-- Fix
	[ "Orcish Stonechucker"		] = { 3 },	-- Fix
	[ "Orcish Trooper"			] = { 3 },	-- Fix
	[ "Orcish Veteran"			] = { 3 },	-- Fix
	[ "Orcish Warchief"			] = { 3 },	-- Fix
	[ "Orcish Zerker"			] = { 3 },	-- Fix

	-- オークの戦闘機械
	[ "Orcish Firebelcher"		] = { 3 },	-- Fix
	[ "Orcish Flamethrower"		] = { 3 },	-- Fix
	[ "Orcish Stonelauncher"	] = { 3 },	-- Fix

	-- 大羊族
	[ "Broo"					] = { { [   0 ] = 3, [ 132 ] = 0 } },	-- Fix
	[ "Brutal Sheep"			] = { 2 },	-- Fix
	[ "Charging Sheep"			] = { 2 },	-- Fix
	[ "Gigas's Sheep"			] = { 0 },	-- Fix
	[ "Mad Sheep"				] = { 2 },	-- Fix
	[ "Ornery Sheep"			] = { 2 },	-- Fix
	[ "Tavnazian Sheep"			] = { 2 },	-- Fix
	[ "Wild Sheep"				] = { 2 },	-- Fix

	-- カラクール・大羊族

	-- 大羊族(雄羊)
	[ "Battering Ram"			] = { 1 },	-- Fix
	[ "Tavnazian Ram"			] = { 3 },	-- Fix
	[ "Tremor Ram"				] = { 1 },	-- Fix

	-- オポオポ族
	[ "Bullbeggar"				] = { 3 },	-- Fix
	[ "Coastal Opo-opo"			] = { 2 },	-- Fix
	[ "Old Opo-opo"				] = { 2 },	-- Fix
	[ "Temple Opo-opo"			] = { 2 },	-- Fix
	[ "Young Opo-opo"			] = { 2 },	-- Fix

	-- オメガ族

	-- オロボン族

	-- カーディアン族
	[ "Eight of Batons"			] = { 3 },	-- Fix
	[ "Eight of Coins"			] = { 3 },	-- Fix
	[ "Eight of Cups"			] = { 3 },	-- Fix
	[ "Eight of Swords"			] = { 3 },	-- Fix
	[ "Five of Batons"			] = { 3 },	-- Fix
	[ "Five of Coins"			] = { 3 },	-- Fix
	[ "Five of Cups"			] = { 3 },	-- Fix
	[ "Five of Swords"			] = { 3 },	-- Fix
	[ "Four of Batons"			] = { 3 },	-- Fix
	[ "Four of Coins"			] = { 3 },	-- Fix
	[ "Four of Cups"			] = { 3 },	-- Fix
	[ "Four of Swords"			] = { 3 },	-- Fix
	[ "Nine of Batons"			] = { 3 },	-- Fix
	[ "Nine of Coins"			] = { 3 },	-- Fix
	[ "Nine of Cups"			] = { 3 },	-- Fix
	[ "Nine of Swords"			] = { 3 },	-- Fix
	[ "Seven of Batons"			] = { 3 },	-- Fix
	[ "Seven of Coins"			] = { 3 },	-- Fix
	[ "Seven of Cups"			] = { 3 },	-- Fix
	[ "Seven of Swords"			] = { 3 },	-- Fix
	[ "Six of Batons"			] = { 3 },	-- Fix
	[ "Six of Coins"			] = { 3 },	-- Fix
	[ "Six of Cups"				] = { 3 },	-- Fix
	[ "Six of Swords"			] = { 3 },	-- Fix
	[ "Ten of Batons"			] = { 3 },	-- Fix
	[ "Ten of Coins"			] = { 3 },	-- Fix
	[ "Ten of Cups"				] = { 3 },	-- Fix
	[ "Ten of Swords"			] = { 3 },	-- Fix
	[ "Three of Batons"			] = { 3 },	-- Fix
	[ "Three of Coins"			] = { 3 },	-- Fix
	[ "Three of Cups"			] = { 3 },	-- Fix
	[ "Three of Swords"			] = { 3 },	-- Fix
	[ "Two of Batons"			] = { 3 },	-- Fix
	[ "Two of Coins"			] = { 3 },	-- Fix
	[ "Two of Cups"				] = { 3 },	-- Fix
	[ "Two of Swords"			] = { 3 },	-- Fix

	-- キキルン族

	-- キノコ族
	[ "Cave Funguar"			] = { 2 },	-- Fix
	[ "Death Cap"				] = { 2 },	-- Fix
	[ "Exoray"					] = { 3 },	-- Fix
	[ "Fly Agaric"				] = { 2 },	-- Fix
	[ "Forest Funguar"			] = { 2 },	-- Fix
	[ "Grass Funguar"			] = { 0 },	-- Fix
	[ "Jugner Funguar"			] = { { [   0 ] = 2, [  84 ] = 3 } },	-- Fix
	[ "Killer Mushroom"			] = { 2 },	-- Fix
	[ "Marsh Funguar"			] = { { [   0 ] = 1, [ 109 ] = 2 } },
	[ "Myconid"					] = { 3 },	-- Fix
	[ "Myxomycete"				] = { 2 },	-- Fix
	[ "Poison Funguar"			] = { { [   0 ] = 1, [   2 ] = 2 } },	-- Fix
	[ "Shrieker"				] = { { [   0 ] = 3, [   2 ] = 1 } },	-- Fix
	[ "Toadstool"				] = { 2 },	-- Fix

	-- キマイラ族

	-- 巨人族
	[ "Blizzard Gigas"			] = { 3 },	-- Fix
	[ "Frost Gigas"				] = { 3 },	-- Fix
	[ "Giant Ascetic"			] = { 3 },	-- Fix
	[ "Giant Gatekeeper"		] = { 3 },	-- Fix
	[ "Giant Guard"				] = { 3 },	-- Fix
	[ "Giant Hunter"			] = { 3 },	-- Fix
	[ "Giant Lobber"			] = { 3 },	-- Fix
	[ "Giant Ranger"			] = { 3 },	-- Fix
	[ "Giant Sentry"			] = { 3 },	-- Fix
	[ "Giant Trapper"			] = { 3 },	-- Fix
	[ "Gigas Bonecutter"		] = { 3 },	-- Fix
	[ "Gigas Braver"			] = { 3 },	-- Fix
	[ "Gigas Butcher"			] = { 3 },	-- Fix
	[ "Gigas Catapulter"		] = { 3 },	-- Fix
	[ "Gigas Fighter"			] = { 3 },	-- Fix
	[ "Gigas Foreman"			] = { 3 },	-- Fix
	[ "Gigas Hallwatcher"		] = { 3 },	-- Fix
	[ "Gigas Jailer"			] = { 3 },	-- Fix
	[ "Gigas Kettlemaster"		] = { 3 },	-- Fix
	[ "Gigas Martialist"		] = { 3 },	-- Fix
	[ "Gigas Punisher"			] = { 3 },	-- Fix
	[ "Gigas Quarrier"			] = { 3 },	-- Fix
	[ "Gigas Sculptor"			] = { 3 },	-- Fix
	[ "Gigas Slinger"			] = { 3 },	-- Fix
	[ "Gigas Spirekeeper"		] = { 3 },	-- Fix
	[ "Gigas Stonecarrier"		] = { 3 },	-- Fix
	[ "Gigas Stonegrinder"		] = { 3 },	-- Fix
	[ "Gigas Stonemason"		] = { 3 },	-- Fix
	[ "Gigas Torturer"			] = { 3 },	-- Fix
	[ "Gigas Wallwatcher"		] = { 3 },	-- Fix
	[ "Gigas Warwolf"			] = { 3 },	-- Fix
	[ "Gigas Wrestler"			] = { 3 },	-- Fix
	[ "Graupel Gigas"			] = { 3 },	-- Fix
	[ "Hail Gigas"				] = { 3 },	-- Fix
	[ "Jotunn Gatekeeper"		] = { 3 },	-- Fix
	[ "Jotunn Hallkeeper"		] = { 3 },	-- Fix
	[ "Jotunn Wallkeeper"		] = { 3 },	-- Fix
	[ "Jotunn Wildkeeper"		] = { 3 },	-- Fix
	[ "Rime Gigas"				] = { 3 },	-- Fix
	[ "Sleet Gigas"				] = { 3 },	-- Fix
	[ "Snow Gigas"				] = { 3 },	-- Fix

	-- クァール族
	[ "Attohwa Coeurl"			] = { 1 },	-- Fix
	[ "Coeurl"					] = { 1 },	-- Fix
	[ "Champaign Coeurl"		] = { 1 },	-- Fix
	[ "Jungle Coeurl"			] = { 1 },	-- Fix
	[ "Master Coeurl"			] = { 1 },	-- Fix
	[ "Torama"					] = { 1 },	-- Fix

	-- グゥーブー族
	[ "Elder Goobbue"			] = { 3 },	-- Fix
	[ "Goobbue"					] = { 1 },	-- Fix
	[ "Goobbue Farmer"			] = { 1 },	-- Fix
	[ "Goobbue Gardener"		] = { 3 },	-- Fix
	[ "Old Goobbue"				] = { 3 },	-- Fix

	-- クゥダフ族
	[ "Ancient Quadav"			] = { 3 },	-- Fix
	[ "Amber Quadav"			] = { 3 },	-- Fix
	[ "Amethyst Quadav"			] = { 3 },	-- Fix
	[ "Brass Quadav"			] = { 3 },	-- Fix
	[ "Bronze Quadav"			] = { 3 },	-- Fix
	[ "Copper Quadav"			] = { 3 },	-- Fix
	[ "Darksteel Quadav"		] = { 3 },	-- Fix
	[ "Elder Quadav"			] = { 3 },	-- Fix
	[ "Emerald Quadav"			] = { 3 },	-- Fix
	[ "Garnet Quadav"			] = { 3 },	-- Fix
	[ "Gold Quadav"				] = { 3 },	-- Fix
	[ "Greater Quadav"			] = { 3 },	-- Fix
	[ "Iron Quadav"				] = { 3 },	-- Fix
	[ "Mythril Quadav"			] = { 3 },	-- Fix
	[ "Old Quadav"				] = { 3 },	-- Fix
	[ "Onyx Quadav"				] = { 3 },	-- Fix
	[ "Platinum Quadav"			] = { 3 },	-- Fix
	[ "Sapphire Quadav"			] = { 3 },	-- Fix
	[ "Silver Quadav"			] = { 3 },	-- Fix
	[ "Spinel Quadav"			] = { 3 },	-- Fix
	[ "Steel Quadav"			] = { 3 },	-- Fix
	[ "Topaz Quadav"			] = { 3 },	-- Fix
	[ "Veteran Quadav"			] = { 3 },	-- Fix
	[ "Young Quadav"			] = { 3 },	-- Fix
	[ "Zircon Quadav"			] = { 3 },	-- Fix

	-- クトゥルブ族

	-- クラブ族
	[ "Bigclaw"					] = { { [   0 ] = 1, [  25 ] = 0, [  59 ] = 0, [  58 ] = 0 } },	-- Fix
	[ "Clipper"					] = { { [   0 ] = 1, [ 110 ] = 0, [ 105 ] = 0, [ 126 ] = 0, [ 173 ] = 0, [  84 ] = 0, [  91 ] = 0, [ 193 ] = 2 } },		-- Fix
	[ "Crimson Knight Crab"		] = { 0 },	-- Fix
	[ "Cutter"					] = { { [   0 ] = 1, [   3 ] = 0 } },	-- Fix
	[ "Greatclaw"				] = { 1 },	-- Fix
	[ "Ironshell"				] = { 1 },	-- Fix
	[ "Knight Crab"				] = { { [   0 ] = 0, [ 104 ] = 3 } },	-- Fix
	[ "Land Crab"				] = { { [   0 ] = 1, [ 107 ] = 0 } },	-- Fix
	[ "River Crab"				] = { { [   0 ] = 0, [  89 ] = 1 } },	-- Fix
	[ "Robber Crab"				] = { { [   0 ] = 1, [  83 ] = 0 } },	-- Fix
	[ "Rock Crab"				] = { 1 },	-- Fix
	[ "Scavenger Crab"			] = { 1 },	-- Fix
	[ "Sea Crab"				] = { 0 },	-- Fix
	[ "Snipper"					] = { { [   0 ] = 1, [ 104 ] = 0, [ 109 ] = 0, [ 103 ] = 0, [ 118 ] = 0, [  82 ] = 0, [  90 ] = 0, [ 191 ] = 2, [ 193 ] = 2 } },	-- Fix
	[ "Steelshell"				] = { 1 },	-- Fix
	[ "Thickshell"				] = { { [   0 ] = 0, [ 102 ]= 1 } },	-- Fix
	[ "Wadi Crab"				] = { 2 },	-- Fix

	-- クレイヴァー族
	[ "Craver"					] = { 1 },	-- Fix

	-- クロウラー族
	[ "Berry Grub"				] = { 2 },	-- Fix
	[ "Carnivorous Crawler"		] = { 2 },	-- Fix
	[ "Caterchipillar"			] = { 3 },	-- Fix
	[ "Canyon Crawler"			] = { 2 },	-- Fix
	[ "Caterpillar"				] = { 2 },	-- Fix
	[ "Crawler"					] = { 2 },	-- Fix
	[ "Knight Crawler"			] = { 3 },	-- Fix
	[ "Larva"					] = { 3 },	-- Fix
	[ "Meat Maggot"				] = { 3 },	-- Fix
	[ "Processionaire"			] = { 3 },	-- Fix
	[ "Rumble Crawler"			] = { { [   0 ] = 2, [ 197 ] = 3 } },	-- Fix
	[ "Soldier Crawler"			] = { { [   0 ] = 2, [ 197 ] = 3 } },	-- Fix
	[ "Worker Crawler"			] = { 2 },	-- Fix

	-- エルカ・クロウラー族

	-- ケルベロス族

	-- 剣虎族
	[ "Gigas's Tiger"			] = { 0 },	-- Fix
	[ "Goblin's Tiger"			] = { 0 },	-- Fix
	[ "Forest Tiger"			] = { 1 },	-- Fix
	[ "Old Sabertooth"			] = { 3 },	-- Fix
	[ "Ovinnik"					] = { 1 },	-- Fix
	[ "Sabertooth Tiger"		] = { { [   0 ] = 1, [ 120 ] = 3 } },	-- Fix
	[ "Tundra Tiger"			] = { 1 },	-- Fix
	[ "Uleguerand Tiger"		] = { 1 },	-- Fix

	-- 甲虫族
	[ "Armet Beetle"			] = { 3 },	-- Fix
	[ "Beady Beetle"			] = { { [   0 ] = 1, [   2 ] = 2 } },	-- Fix
	[ "Blazer Beetle"			] = { 3 },	-- Fix
	[ "Borer Beetle"			] = { 1 },	-- Fix
	[ "Chamber Beetle"			] = { 3 },	-- Fix
	[ "Copper Beetle"			] = { 2 },	-- Fix
	[ "Deathwatch Beetle"		] = { 2 },	-- Fix
	[ "Desert Beetle"			] = { 2 },	-- Fix
	[ "Diving Beetle"			] = { 2 },	-- Fix
	[ "Dung Beetle"				] = { 2 },	-- Fix
	[ "Goblin's Beetle"			] = { 0 },	-- Fix
	[ "Goliath Beetle"			] = { { [   0 ] = 3, [  83 ] = 2 } },	-- Fix
	[ "Helm Beetle"				] = { { [   0 ] = 2, [ 197 ] = 3 } },	-- Fix
	[ "Nest Beetle"				] = { 2 },	-- Fix
	[ "Sand Beetle"				] = { 2 },	-- Fix
	[ "Scarab Beetle"			] = { 2 },	-- Fix
	[ "Stag Beetle"				] = { 2 },	-- Fix
	[ "Starmite"				] = { 3 },	-- Fix

	-- コウモリ族(1匹)
	[ "Acro Bat"				] = { 0 },	-- Fix
	[ "Ancient Bat"				] = { { [   0 ] = 3, [ 126 ] = 1, [ 184 ] = 1 } },	-- Fix
	[ "Battle Bat"				] = { 3 },	-- Fix
	[ "Big Bat"					] = { 1 },	-- Fix
	[ "Bilesucker"				] = { 2 },	-- Fix
	[ "Black Bat"				] = { 2 },	-- Fix
	[ "Blade Bat"				] = { { [   0 ] = 1, [ 192 ] = 2 } },	-- Fix
	[ "Bulwark Bat"				] = { 1 },	-- Fix
	[ "Camazotz"				] = { { [   0 ] = 3, [   9 ] = 1 } },	-- Fix
	[ "Cheiroptera"				] = { 1 },	-- Fix
	[ "Combat"					] = { { [   0 ] = 2, [ 194 ] = 3 } },	-- Fix
	[ "Dire Bat"				] = { { [   0 ] = 3, [ 164 ] = 2, [  12 ] = 2, [   9 ] = 1 } },	-- Fix
	[ "Esbat"					] = { 1 },	-- Fix
	[ "Fledermaus"				] = { 2 },	-- Fix
	[ "Fomor's Bat"				] = { 0 },	-- Fix
	[ "Gigas's Bat"				] = { 0 },	-- Fix
	[ "Giant Bat"				] = { 1 },	-- Fix
	[ "Glow Bat"				] = { 2 },	-- Fix
	[ "Goblin's Bat"			] = { 0 },	-- Fix
	[ "Grave Bat"				] = { 3 },	-- Fix
	[ "Greater Gayla"			] = { { [   0 ] = 2, [ 127 ] = 1 } },	-- Fix
	[ "Hell Bat"				] = { { [   0 ] = 2, [ 169 ] = 3 } },	-- Fix
	[ "Hognosed Bat"			] = { 1 },	-- Fix
	[ "Moon Bat"				] = { 2 },	-- Fix
	[ "Mouse Bat"				] = { { [   0 ] = 2, [ 172 ] = 0 } },	-- Fix
	[ "Poison Bat"				] = { 1 },	-- Fix
	[ "Purgatory Bat"			] = { { [   0 ] = 2, [  62 ] = 3, [   9 ] = 1 } },	-- Fix
	[ "Specter Bat"				] = { 1 },	-- Fix
	[ "Siege Bat"				] = { 2 },	-- Fix
	[ "Star Bat"				] = { 0 },	-- Fix
	[ "Stealth Bat"				] = { 3 },	-- Fix
	[ "Stirge"					] = { { [   0 ] = 1, [ 166 ] = 3, [  11 ] = 2 } },	-- Fix
	[ "Tomb Bat"				] = { 3 },	-- Fix
	[ "Vampire Bat"				] = { { [   0 ] = 2, [ 204 ] = 1 } },	-- Fix
	[ "Werebat"					] = { 1 },	-- Fix
	[ "Wolf Bat"				] = { { [   0 ] = 1, [  85 ] = 0 } },	-- Fix

	-- コウモリ族(3匹)
	[ "Bastion Bats"			] = { { [   0 ] = 1, [  99 ] = 2 } },	-- Fix
	[ "Bat Battalion"			] = { 2 },	-- Fix
	[ "Battue Bats"				] = { 0 },	-- Fix
	[ "Bulldog Bats"			] = { 1 },	-- Fix
	[ "Canal Bats"				] = { { [   0 ] = 2, [ 169 ] = 3 } },	-- Fix
	[ "Citadel Bats"			] = { 3 },	-- Fix
	[ "Ding Bats"				] = { 0 },	-- Fix
	[ "Dark Bats"				] = { 2 },	-- Fix
	[ "Fomor's Bats"			] = { 0 },	-- Fix
	[ "Funnel Bats"				] = { 3 },	-- Fix
	[ "Gale Bats"				] = { 0 },	-- Fix
	[ "Gigas's Bats"			] = { 0 },	-- Fix
	[ "Goblin's Bats"			] = { 0 },	-- Fix
	[ "Greater Gaylas"			] = { 2 },	-- Fix
	[ "Grotto Bats"				] = { 3 },	-- Fix
	[ "Impish Bats"				] = { 3 },	-- Fix
	[ "Incubus Bats"			] = { { [   0 ] = 3, [  52 ] = 2 } },	-- Fix
	[ "Lesser Gaylas"			] = { 3 },	-- Fix
	[ "Midnight Wings"			] = { 2 },	-- Fix
	[ "Mold Bats"				] = { 1 },	-- Fix
	[ "Night Bats"				] = { { [   0 ] = 0, [ 119 ] = 2, [  97 ] = 2 } },	-- Fix
	[ "Nightmare Bats"			] = { { [   0 ] = 3, [   5 ] = 1, [  12 ] = 2 } },	-- Fix
	[ "Plague Bats"				] = { { [   0 ] = 1, [ 190 ] = 3 } },	-- Fix
	[ "Sand Bats"				] = { 1 },	-- Fix
	[ "Seeker Bats"				] = { { [   0 ] = 2, [ 193 ] = 3, [ 198 ] = 3, [ 184 ] = 1 } },	-- Fix
	[ "Spectacled Bats"			] = { { [   0 ] = 0, [ 141 ] = 2 } },	-- Fix
	[ "Stink Bats"				] = { 2 },	-- Fix
	[ "Succubus Bats"			] = { { [   0 ] = 2, [   5 ] = 1, [ 160 ] = 3 } },	-- Fix
	[ "Tower Bats"				] = { 1 },	-- Fix
	[ "Troika Bats"				] = { 2 },	-- Fix
	[ "Undead Bats"				] = { { [   0 ] = 2, [ 204 ] = 1 } },	-- Fix
	[ "Underworld Bats"			] = { 3 },	-- Fix
	[ "Wind Bats"				] = { { [   0 ] = 0, [ 190 ] = 2 } },	-- Fix
	[ "Wingrats"				] = { 2 },	-- Fix
	[ "Wood Bats"				] = { { [   0 ] = 1, [  85 ] = 0 } },	-- Fix

	-- ゴージャー族
	[ "Gorger"					] = { 1 },	-- Fix

	-- コース族
	[ "Arch Corse"				] = { 1 },	-- Fix
	[ "Corse"					] = { 1 },	-- Fix

	-- ゴースト族
	[ "Banshee"					] = { 1 },	-- Fix
	[ "Bhuta"					] = { 1 },	-- Fix
	[ "Blood Soul"				] = { 1 },	-- Fix
	[ "Bogy"					] = { 1 },	-- Fix
	[ "Crypt Ghost"				] = { 1 },	-- Fix
	[ "Gespenst"				] = { 1 },	-- Fix
	[ "Erlik"					] = { 1 },	-- Fix
	[ "Etemmu"					] = { 1 },	-- Fix
	[ "Evil Spirit"				] = { 1 },	-- Fix
	[ "Fantasma"				] = { 1 },	-- Fix
	[ "Haunt"					] = { 1 },	-- Fix
	[ "Lemures"					] = { 1 },	-- Fix
	[ "Lugat"					] = { 1 },	-- Fix
	[ "Phantom"					] = { 1 },	-- Fix
	[ "Phasma"					] = { 1 },	-- Fix
	[ "Revenant"				] = { 1 },	-- Fix
	[ "Spook"					] = { 1 },	-- Fix
	[ "Srei Ap"					] = { 1 },	-- Fix
	[ "Utukku"					] = { 1 },	-- Fix
	[ "Wraith"					] = { 1 },	-- Fix

	-- ブフート・ゴースト族

	-- ゴーレム族
	[ "Aura Statue"				] = { 1 },	-- Fix
	[ "Colossus"				] = { 1 },	-- Fix
	[ "Darksteel Golem"			] = { 1 },	-- Fix
	[ "Enkidu"					] = { 1 },	-- Fix
	[ "Mythril Golem"			] = { 1 },	-- Fix
	[ "Ore Golem"				] = { 1 },	-- Fix
	[ "Rock Golem"				] = { 1 },	-- Fix
	[ "Stone Golem"				] = { 1 },	-- Fix

	-- コカトリス族
	[ "Axe Beak"				] = { 1 },	-- Fix
	[ "Cockatrice"				] = { 1 },	-- Fix
	[ "Greater Cockatrice"		] = { 1 },	-- Fix
	[ "Sand Cockatrice"			] = { 1 },	-- Fix
	[ "Tabar Beak"				] = { 1 },	-- Fix

	-- ジズ・コカトリス族

	-- ゴブリン族
	[ "Goblin Alchemist"		] = { 3 },	-- Fix
	[ "Goblin Ambusher"			] = { 3 },	-- Fix
	[ "Goblin Artificer"		] = { 3 },	-- Fix
	[ "Goblin Bandit"			] = { 3 },	-- Fix
	[ "Goblin Bouncer"			] = { 3 },	-- Fix
	[ "Goblin Bounty Hunter"	] = { 3 },	-- Fix
	[ "Goblin Butcher"			] = { 3 },	-- Fix
	[ "Goblin Chaser"			] = { 3 },	-- Fix
	[ "Goblin Craftsman"		] = { 3 },	-- Fix
	[ "Goblin Digger"			] = { 3 },	-- Fix
	[ "Goblin Doorman"			] = { 3 },	-- Fix
	[ "Goblin Enchanter"		] = { 3 },	-- Fix
	[ "Goblin Fireman"			] = { 3 },	-- Fix
	[ "Goblin Fisher"			] = { 3 },	-- Fix
	[ "Goblin Foreman"			] = { 3 },	-- Fix
	[ "Goblin Freelance"		] = { 3 },	-- Fix
	[ "Goblin Furrier"			] = { 3 },	-- Fix
	[ "Goblin Gambler"			] = { 3 },	-- Fix
	[ "Goblin Gutterman"		] = { 3 },	-- Fix
	[ "Goblin Hangman"			] = { 3 },	-- Fix
	[ "Goblin Hammerman"		] = { 3 },	-- Fix
	[ "Goblin Headman"			] = { 3 },	-- Fix
	[ "Goblin Hoodoo"			] = { 3 },	-- Fix
	[ "Goblin Hunter"			] = { 3 },	-- Fix
	[ "Goblin Jeweler"			] = { 3 },	-- Fix
	[ "Goblin Junkman"			] = { 3 },	-- Fix
	[ "Goblin Leadman"			] = { 3 },	-- Fix
	[ "Goblin Leecher"			] = { 3 },	-- Fix
	[ "Goblin Lengthman"		] = { 3 },	-- Fix
	[ "Goblin Marksman"			] = { 3 },	-- Fix
	[ "Goblin Mercenary"		] = { 3 },	-- Fix
	[ "Goblin Miner"			] = { 3 },	-- Fix
	[ "Goblin Mugger"			] = { 3 },	-- Fix
	[ "Goblin Oilman"			] = { 3 },	-- Fix
	[ "Goblin Packman"			] = { 3 },	-- Fix
	[ "Goblin Pathfinder"		] = { 3 },	-- Fix
	[ "Goblin Poacher"			] = { 3 },	-- Fix
	[ "Goblin Reaper"			] = { 3 },	-- Fix
	[ "Goblin Robber"			] = { 3 },	-- Fix
	[ "Goblin Shaman"			] = { 3 },	-- Fix
	[ "Goblin Shepherd"			] = { 3 },	-- Fix
	[ "Goblin Shovelman"		] = { 3 },	-- Fix
	[ "Goblin Smithy"			] = { 3 },	-- Fix
	[ "Goblin Swordsman"		] = { 3 },	-- Fix
	[ "Goblin Tamer"			] = { 3 },	-- Fix
	[ "Goblin Thug"				] = { 3 },	-- Fix
	[ "Goblin Tinkerer"			] = { 3 },	-- Fix
	[ "Goblin Tollman"			] = { 3 },	-- Fix
	[ "Goblin Trader"			] = { 3 },	-- Fix
	[ "Goblin Veterinarian"		] = { 3 },	-- Fix
	[ "Goblin Weaver"			] = { 3 },	-- Fix
	[ "Goblin Welldigger"		] = { 3 },	-- Fix
	[ "Hobgoblin Alastor"		] = { 3 },	-- Fix
	[ "Hobgoblin Angler"		] = { 3 },	-- Fix
	[ "Hobgoblin Animalier"		] = { 3 },	-- Fix
	[ "Hobgoblin Blagger"		] = { 3 },	-- Fix
	[ "Hobgoblin Fascinator"	] = { 3 },	-- Fix
	[ "Hobgoblin Martialist"	] = { 3 },	-- Fix
	[ "Hobgoblin Physician"		] = { 3 },	-- Fix
	[ "Hobgoblin Toreador"		] = { 3 },	-- Fix
	[ "Hobgoblin Venerer"		] = { 3 },	-- Fix

	-- ゴブリン族(バグベア)
	[ "Bugbear Bondman"			] = { 3 },	-- Fix
	[ "Bugbear Deathsman"		] = { 3 },	-- Fix
	[ "Bugbear Servingman"		] = { 3 },	-- Fix
	[ "Bugbear Trashman"		] = { 3 },	-- Fix
	[ "Bugbear Watchman"		] = { 3 },	-- Fix

	-- ゴブリン族(モブリン)
	[ "Moblin Aidman"			] = { 3 },	-- Fix
	[ "Moblin Ashman"			] = { 3 },	-- Fix
	[ "Moblin Chapman"			] = { 3 },	-- Fix
	[ "Moblin Coalman"			] = { 3 },	-- Fix
	[ "Moblin Draftsman"		] = { 3 },	-- Fix
	[ "Moblin Engineman"		] = { 3 },	-- Fix
	[ "Moblin Gasman"			] = { 3 },	-- Fix
	[ "Moblin Groundman"		] = { 3 },	-- Fix
	[ "Moblin Gurneyman"		] = { 3 },	-- Fix
	[ "Moblin Pickman"			] = { 3 },	-- Fix
	[ "Moblin Pikeman"			] = { 3 },	-- Fix
	[ "Moblin Scalpelman"		] = { 3 },	-- Fix
	[ "Moblin Ragman"			] = { 3 },	-- Fix
	[ "Moblin Rapairman"		] = { 3 },	-- Fix
	[ "Moblin Roadman"			] = { 3 },	-- Fix
	[ "Moblin Rodman"			] = { 3 },	-- Fix
	[ "Moblin Tankman"			] = { 3 },	-- Fix
	[ "Moblin Topsman"			] = { 3 },	-- Fix
	[ "Moblin Witchman"			] = { 3 },	-- Fix
	[ "Moblin Workman"			] = { 3 },	-- Fix
	[ "Moblin Yardman"			] = { 3 },	-- Fix

	-- ゴラホ族
	[ "Aw'ghrah"				] = { 1 },	-- Fix
	[ "Eo'ghrah"				] = { 1 },	-- Fix

	-- コリブリ族

	-- サソリ族
	[ "Antares"					] = { 1 },	-- Fix
	[ "Cave Scorpion"			] = { 1 },	-- Fix
	[ "Crawler Hunter"			] = { 3 },	-- Fix
	[ "Cutlass Scorpion"		] = { 1 },	-- Fix
	[ "Den Scorpion"			] = { 1 },	-- Fix
	[ "Diplopod"				] = { 1 },	-- Fix
	[ "Doom Scorpion"			] = { { [   0 ] = 1, [ 197 ] = 3, [ 171 ] = 3 } },	-- Fix
	[ "Giant Scorpion"			] = { 1 },	-- Fix
	[ "Girtab"					] = { 1 },	-- Fix
	[ "Labyrinth Scorpion"		] = { 1 },	-- Fix
	[ "Maze Scorpion"			] = { 1 },	-- Fix
	[ "Mine Scorpion"			] = { 1 },	-- Fix
	[ "Mushussu"				] = { { [   0 ] = 1, [ 197 ] = 3 } },	-- Fix
	[ "Scimitar Scorpion"		] = { 1 },	-- Fix
	[ "Sulfur Scorpion"			] = { 1 },	-- Fix
	[ "Tulwar Scorpion"			] = { 1 },	-- Fix

	-- サハギン族
	[ "Bog Sahagin"				] = { 3 },	-- Fix
	[ "Brook Sahagin"			] = { 3 },	-- Fix
	[ "Coastal Sahagin"			] = { 3 },	-- Fix
	[ "Creek Sahagin"			] = { 3 },	-- Fix
	[ "Delta Sahagin"			] = { 3 },	-- Fix
	[ "Lagoon Sahagin"			] = { 3 },	-- Fix
	[ "Lake Sahagin"			] = { 3 },	-- Fix
	[ "Marsh Sahagin"			] = { 3 },	-- Fix
	[ "Pond Sahagin"			] = { 3 },	-- Fix
	[ "Riparian Sahagin"		] = { 3 },	-- Fix
	[ "River Sahagin"			] = { 3 },	-- Fix
	[ "Rivulet Sahagin"			] = { 3 },	-- Fix
	[ "Shore Sahagin"			] = { 3 },	-- Fix
	[ "Spring Sahagin"			] = { 3 },	-- Fix
	[ "Stream Sahagin"			] = { 3 },	-- Fix
	[ "Swamp Sahagin"			] = { 3 },	-- Fix

	-- サボテンダー族
	[ "Cactuar"					] = { 1 },	-- Fix
	[ "Sabotender"				] = { 1 },	-- Fix
	[ "Sabotender Bailaor"		] = { 1 },	-- Fix
	[ "Sabotender Sediendo"		] = { 1 },	-- Fix
	[ "Spelunking Sabotender" 	] = { 1 },	-- Fix

	-- シーザー族
	[ "Seether"					] = { 1 },	-- Fix

	-- 屍犬族
	[ "Bandersnatch"			] = { 1 },	-- Fix
	[ "Barghest"				] = { 1 },	-- Fix
	[ "Black Wolf"				] = { 1 },	-- Fix
	[ "Bog Dog"					] = { 1 },	-- Fix
	[ "Cwn Annwn"				] = { 1 },	-- Fix
	[ "Garm"					] = { 1 },	-- Fix
	[ "Hati"					] = { 1 },	-- Fix
	[ "Hecatomb Hound"			] = { 1 },	-- Fix
	[ "Hell Hound"				] = { 1 },	-- Fix
	[ "Mad Fox"					] = { 1 },	-- Fix
	[ "Marchosias"				] = { 1 },	-- Fix
	[ "Mauthe Doog"				] = { 1 },	-- Fix
	[ "Scavenging Hound"		] = { 1 },	-- Fix
	[ "Tainted Hound"			] = { 1 },	-- Fix
	[ "Tomb Wolf"				] = { 1 },	-- Fix
	[ "Wolf Zombie"				] = { 1 },	-- Fix

	-- 死鳥族
	[ "Akbaba"					] = { 2 },	-- Fix
	[ "Ba"						] = { 2 },	-- Fix
	[ "Carrion Crow"			] = { { [   0 ] = 0, [  96 ] = 2 } },	-- Fix
	[ "Flamingo"				] = { 0 },	-- Fix
	[ "Jubjub"					] = { 2 },	-- Fix
	[ "Raven"					] = { 2 },	-- Fix
	[ "Riverne Vulture"			] = { 0 },	-- Fix
	[ "Screamer"				] = { { [   0 ] = 2, [  82 ] = 0 } },	-- Fix
	[ "Toucan"					] = { 0 },	-- Fix
	[ "Tragopan"				] = { 2 },	-- Fix
	[ "Vulture"					] = { { [   0 ] = 2, [  88 ] = 0 } },	-- Fix
	[ "Zu"						] = { 2 },	-- Fix

	-- シャドウ族
	[ "Dark Stalker"			] = { 3 },	-- Fix
	[ "Ka"						] = { 3, nil, {  [ 148 ] =   60, [ 562 ] =   60 } },	-- 回避率ダウン	-- Fix
	[ "Shade"					] = { 3 },	-- Fix
	[ "Shadow"					] = { 3 },	-- Fix
	[ "Specter"					] = { 3 },	-- Fix
	[ "Spriggan"				] = { 3 },	-- Fix

	-- シャドウ族(フォモル)
	[ "Fomor Bard"				] = { 1 },	-- Fix
	[ "Fomor Beastmater"		] = { 1 },	-- Fix
	[ "Fomor Black Mage"		] = { 1 },	-- Fix
	[ "Fomor Dark Knight"		] = { 1 },	-- Fix
	[ "Fomor Dragoon"			] = { 1 },	-- Fix
	[ "Fomor Monk"				] = { 1 },	-- Fix
	[ "Fomor Ninja"				] = { 1 },	-- Fix
	[ "Fomor Paladin"			] = { 1 },	-- Fix
	[ "Fomor Ranger"			] = { 1 },	-- Fix
	[ "Fomor Red Mage"			] = { 1 },	-- Fix
	[ "Fomor Samurai"			] = { 1 },	-- Fix
	[ "Fomor Summoner"			] = { 1 },	-- Fix
	[ "Fomor Thief"				] = { 1 },	-- Fix
	[ "Fomor Warrior"			] = { 1 },	-- Fix

	-- 樹人族
	[ "Leshy"					] = { 0 },	-- Fix
	[ "Treant"					] = { 1 },	-- Fix
	[ "Walking Tree"			] = { 1 },	-- Fix
	[ "Weeping Willow"			] = { 1 },	-- Fix

	-- 樹人族(若木)
	[ "Boyahda Sapling"			] = { 2 },	-- Fix
	[ "Caveberry"				] = { 2 },	-- Fix
	[ "Cherry Sapling"			] = { 3 },	-- Fix
	[ "Leshachikha"				] = { 2 },	-- Fix
	[ "Slash Pine"				] = { 2 },	-- Fix
	[ "Sobbing Sapling"			] = { 3 },	-- Fix
	[ "Stalking Sapling"		] = { { [   0 ] = 2, [ 193 ] = 0 } },	-- Fix
	[ "Strolling Sapling"		] = { 0 },	-- Fix
	[ "Walking Sapling"			] = { 0 },	-- Fix
	[ "Wandering Sapling"		] = { { [   0 ] = 2, [  89 ] = 0 } },	-- Fix
	[ "Witch Hazel"				] = { 2 },	-- Fix

	-- シンカー族
	[ "Thinker"					] = { 1 },	-- Fix

	-- スケルトン族
	[ "Crossbones"				] = { 1 },	-- Fix
	[ "Doom Guard"				] = { 1 },	-- Fix
	[ "Doom Mage"				] = { 1 },	-- Fix
	[ "Doom Soldier"			] = { 1 },	-- Fix
	[ "Doom Warlock"			] = { 1 },	-- Fix
	[ "Enchanted Bones"			] = { 1 },	-- Fix
	[ "Fallen Evacuee"			] = { 1 },	-- Fix
	[ "Fallen Knight"			] = { 1 },	-- Fix
	[ "Fallen Mage"				] = { 1 },	-- Fix
	[ "Fallen Major"			] = { 1 },	-- Fix
	[ "Fallen Officer"			] = { 1 },	-- Fix
	[ "Fallen Soldier"			] = { 1 },	-- Fix
	[ "Fleshcraver"				] = { 1 },	-- Fix
	[ "Ghast"					] = { 1 },	-- Fix
	[ "Ghoul"					] = { 1 },	-- Fix
	[ "Lich"					] = { 1 },	-- Fix
	[ "Lost Soul" 				] = { 1, nil, { [  30 ] = 3600 } },					-- 呪詛		-- Fix
	[ "Magicked Bones"			] = { 1 },	-- Fix
	[ "Mindcraver"				] = { 1 },	-- Fix
	[ "Mummy"					] = { 1 },	-- Fix
	[ "Nachzehrer"				] = { 1 },	-- Fix
	[ "Rot Prowler"				] = { 1 },	-- Fix
	[ "Ship Wight"				] = { 1 },	-- Fix
	[ "Skeleton Warrior"		] = { 1 },	-- Fix
	[ "Skeleton Sorcerer"		] = { 1 },	-- Fix
	[ "Spartoi Sorcerer"		] = { 1 },	-- Fix
	[ "Spartoi Warrior"			] = { 1 },	-- Fix
	[ "Tomb Mage"				] = { 1 },	-- Fix
	[ "Tomb Warrior"			] = { 1 },	-- Fix
	[ "Wendigo"					] = { 1 },	-- Fix
	[ "Wight"					] = { 1 },	-- Fix
	[ "Zombie"					] = { 1 },	-- Fix

	-- ドラウガー・スケルトン族

	-- スノール族
	[ "Agloolik"				] = { 1 },	-- Fix
	[ "Akselloak"				] = { 1 },	-- Fix
	[ "Avalanche"				] = { 1 },	-- Fix
	[ "Morozko"					] = { 1 },	-- Fix
	[ "Snoll"					] = { 1 },	-- Fix
	[ "Snowball"				] = { 1 },	-- Fix

	-- スパイダー族
	[ "Bark Spider"				] = { 2 },	-- Fix
	[ "Bark Tarantula"			] = { 3 },	-- Fix
	[ "Desert Spider"			] = { 2 },	-- Fix
	[ "Giant Spider"			] = { 2 },	-- Fix
	[ "Goblin's Spider"			] = { 0 },	-- Fix
	[ "Huge Spider"				] = { 2 },	-- Fix
	[ "Recluse Spider"			] = { 3 },	-- Fix
	[ "Sand Spider"				] = { 2 },	-- Fix
	[ "Sand Tarantula"			] = { 3 },	-- Fix

	-- スフィアロイド族
	[ "Defender"				] = { 1 },	-- Fix
	[ "Detector"				] = { 1 },	-- Fix

	-- スライム族
	[ "Acid Grease"				] = { 1 },	-- Fix
	[ "Black Slime"				] = { 1 },	-- Fix
	[ "Blob"					] = { 1 },	-- Fix
	[ "Clot"					] = { 1 },	-- Fix
	[ "Davoi Mush"				] = { 1 },	-- Fix
	[ "Dark Aspic"				] = { 1 },	-- Fix
	[ "Giant Amoeba"			] = { 1 },	-- Fix
	[ "Gloop"					] = { 1 },	-- Fix
	[ "Goblin Gruel"			] = { 1 },	-- Fix
	[ "Hinge Oil"				] = { 1 },	-- Fix
	[ "Jelly"					] = { 1 },	-- Fix
	[ "Mousse"					] = { 1 },	-- Fix
	[ "Oil Slick"				] = { 1 },	-- Fix
	[ "Oil Spill"				] = { 1 },	-- Fix
	[ "Ooze"					] = { 1 },	-- Fix
	[ "Protozoan"				] = { 1 },	-- Fix
	[ "Rancid Ooze"				] = { 1 },	-- Fix
	[ "Rotten Jam"				] = { 1 },	-- Fix
	[ "Stroper Chyme"			] = { 1 },	-- Fix
	[ "Viscous Clot"			] = { 1 },	-- Fix

	-- ゼデー族
	[ "Aw'zdei"					] = { 1 },	-- Fix
	[ "Eo'zdei"					] = { 1 },	-- Fix

	-- ソウルフレア族

	-- ゾミト族
	[ "Aern's Xzomit"			] = { 0 },	-- Fix
	[ "Om'xzomit"				] = { 0 },	-- Fix
	[ "Ul'xzomit"				] = { 2 },	-- Fix

	-- ダイアマイト族
	[ "Diremite"				] = { 0 },	-- Fix
	[ "Diremite Assaulter"		] = { 1 },	-- Fix
	[ "Diremite Dominator"		] = { 1 },	-- Fix
	[ "Diremite Stalker"		] = { 0 },	-- Fix

	-- タウルス族
	[ "Brontotaur"				] = { 3 },	-- Fix
	[ "Molech"					] = { 3 },	-- Fix
	[ "Stegotaur"				] = { 3 },	-- Fix
	[ "Taurus"					] = { 3 },	-- Fix
	[ "Teratotaur"				] = { 3 },	-- Fix
	[ "Tyrannotaur"				] = { 3 },	-- Fix

	-- ダルメル族
	[ "Bull Dhalmel"			] = { 2 },	-- Fix
	[ "Catoblepas"				] = { 2 },	-- Fix
	[ "Desert Dhalmel"			] = { 2 },	-- Fix
	[ "Marine Dhalmel"			] = { 2 },	-- Fix
	[ "Wild Dhalmel"			] = { 2 },	-- Fix

	-- チゴー族

	-- デーモン族
	[ "Abyssal Demon"			] = { 3 },	-- Fix
	[ "Arch Demon"				] = { 3 },	-- Fix
	[ "Blood Demon"				] = { 3 },	-- Fix
	[ "Demon Chancellor"		] = { 3 },	-- Fix
	[ "Demon Commander"			] = { 3 },	-- Fix
	[ "Demon General"			] = { 3 },	-- Fix
	[ "Demon Knight"			] = { 3 },	-- Fix
	[ "Demon Magistrate"		] = { 3 },	-- Fix
	[ "Demon Pawn"				] = { 3 },	-- Fix
	[ "Demon Warlock"			] = { 3 },	-- Fix
	[ "Demon Wizard"			] = { 3 },	-- Fix
	[ "Doom Demon"				] = { 3 },	-- Fix
	[ "Dread Demon"				] = { 3 },	-- Fix
	[ "Gore Demon"				] = { 3 },	-- Fix
	[ "Judicator Demon"			] = { 3 },	-- Fix
	[ "Kindred Black Mage"		] = { 3 },	-- Fix
	[ "Kindred Dark Knight"		] = { 3 },	-- Fix
	[ "Kindred Summoner"		] = { 3 },	-- Fix
	[ "Kindred Warrior"			] = { 3 },	-- Fix
	[ "Stygian Demon"			] = { 3 },	-- Fix

	-- ドゥーム族
	[ "Addled Tumor"			] = { 1 },	-- Fix
	[ "Doom Toad"				] = { 1 },	-- Fix
	[ "Fetid Flesh"				] = { 1 },	-- Fix
	[ "Foul Meat"				] = { 1 },	-- Fix
	[ "Rotten Sod"				] = { 1 },	-- Fix
	[ "Tainted Flesh"			] = { 1 },	-- Fix

	-- 頭足族
	[ "Colossal Calamari"		] = { 1 },	-- Fix
	[ "Devil Manta"				] = { 1 },	-- Fix
	[ "Flying Manta"			] = { 1 },	-- Fix
	[ "Kraken"					] = { 1 },	-- Fix
	[ "Sea Bonze"				] = { 1 },	-- Fix
	[ "Sea Monk"				] = { 1 },	-- Fix

	-- ドール族
	[ "Aura Gear"				] = { 1 },	-- Fix
	[ "Aura Butler"				] = { 4 },	-- Fix
	[ "Caretaker"				] = { 1 },	-- Fix
	[ "Chaos Idol"				] = { 4 },	-- Fix
	[ "Cursed Puppet"			] = { 4 },	-- Fix
	[ "Demonic Doll"			] = { 4 },	-- Fix
	[ "Drone"					] = { 4 },	-- Fix
	[ "Gargoyle"				] = { 4 },	-- Fix
	[ "Groundskeeper"			] = { 4 },	-- Fix
	[ "Iron Maiden"				] = { 4 },	-- Fix
	[ "Jagd Doll"				] = { 4 },	-- Fix
	[ "Living Statue"			] = { 4 },	-- Fix
	[ "Panzer Doll"				] = { 4 },	-- Fix
	[ "Talos"					] = { 4 },	-- Fix

	-- トカゲ族
	[ "Ash Lizard"				] = { 2 },	-- Fix
	[ "Bane Lizard"				] = { 2 },	-- Fix
	[ "Chasm Lizard"			] = { 2 },	-- Fix
	[ "Frost Lizard"			] = { 2 },	-- Fix
	[ "Geezard"					] = { 3 },	-- Fix
	[ "Hill Lizard"				] = { 2 },	-- Fix
	[ "Ivory Lizard"			] = { 2 },	-- Fix
	[ "Labyrinth Lizard"		] = { { [   0 ] = 2, [ 197 ] = 3, [ 171 ] = 3 } },	-- Fix
	[ "Maze Lizard"				] = { 2 },	-- Fix
	[ "Mist Lizard"				] = { 2 },	-- Fix
	[ "Riding Lizard"			] = { 2 },	-- Fix
	[ "Rock Lizard"				] = { 2 },	-- Fix
	[ "Sand Lizard"				] = { 2 },	-- Fix
	[ "Sentry Lizard"			] = { 2 },	-- Fix
	[ "Snow Lizard"				] = { 2 },	-- Fix
	[ "Tormentor"				] = { 2 },	-- Fix
	[ "War Lizard"				] = { 2 },	-- Fix
	[ "Watch Lizard"			] = { 2 },	-- Fix
	[ "White Lizard"			] = { 2 },	-- Fix

	-- ドラゴン族
	[ "Shadow Dragon"			] = { 1 },	-- Fix

	-- ダハク・ドラゴン族

	-- トロール族

	-- トンベリ族
	[ "Cyptonberry Cutter"		] = { 3 },	-- Fix
	[ "Cyptonberry Harrier"		] = { 3 },	-- Fix
	[ "Cyptonberry Plaguer"		] = { 3 },	-- Fix
	[ "Cyptonberry Stalker"		] = { 3 },	-- Fix
	[ "Tonberry Beleaguerer"	] = { 3 },	-- Fix
	[ "Tonberry Chopper"		] = { 3 },	-- Fix
	[ "Tonberry Creeper"		] = { 3 },	-- Fix
	[ "Tonberry Cutter"			] = { 3 },	-- Fix
	[ "Tonberry Dismayer"		] = { 3 },	-- Fix
	[ "Tonberry Harasser"		] = { 3 },	-- Fix
	[ "Tonberry Harrier"		] = { 3 },	-- Fix
	[ "Tonberry Hexer"			] = { 3 },	-- Fix
	[ "Tonberry Imprecator"		] = { 3 },	-- Fix
	[ "Tonberry Jinxer"			] = { 3 },	-- Fix
	[ "Tonberry Maledictor"		] = { 3 },	-- Fix
	[ "Tonberry Pursuer"		] = { 3 },	-- Fix
	[ "Tonberry Shadower"		] = { 3 },	-- Fix
	[ "Tonberry Slasher"		] = { 3 },	-- Fix
	[ "Tonberry Stabber"		] = { 3 },	-- Fix
	[ "Tonberry Stalker"		] = { 3 },	-- Fix
	[ "Tonberry Trailer"		] = { 3 },	-- Fix

	-- ハイドラ族

	-- 蜂族
	[ "Bumblebee"				] = { 0 },	-- Fix
	[ "Davoi Hornet"			] = { 2 },	-- Fix
	[ "Davoi Wasp"				] = { 3 },	-- Fix
	[ "Death Jacket"			] = { 2 },	-- Fix
	[ "Death Wasp"				] = { 2 },	-- Fix
	[ "Digger Wasp"				] = { { [   0 ] = 3, [   2 ] = 2 } },	-- Fix
	[ "Giant Bee"				] = { 0 },	-- Fix
	[ "Giddeus Bee"				] = { 2 },	-- Fix
	[ "Goblin's Bee"			] = { 0 },	-- Fix
	[ "Huge Hornet"				] = { 0 },	-- Fix
	[ "Huge Wasp"				] = { 0 },	-- Fix
	[ "Killer Bee"				] = { 0 },	-- Fix
	[ "Maneating Hornet"		] = { 0 },	-- Fix
	[ "Miner Bee"				] = { 2 },	-- Fix
	[ "Soul Stinger"			] = { 3 },	-- Fix
	[ "Spider Wasp"				] = { 2 },	-- Fix
	[ "Temple Bee"				] = { 3 },	-- Fix
	[ "Volcano Wasp"			] = { 2 },	-- Fix
	[ "Water Wasp"				] = { 2 },	-- Fix
	[ "Wespe"					] = { 3 },	-- Fix
	[ "Yhoator Wasp"			] = { 2 },	-- Fix

	-- バッファロー族
	[ "Buffalo"					] = { 1 },	-- Fix
	[ "Giant Buffalo"			] = { 1 },	-- Fix
	[ "King Buffalo"			] = { 1 },	-- Fix

	-- ヒッポグリフ族
	[ "Cloud Hippogryph"		] = { 1 },	-- Fix
	[ "Hippogryph"				] = { 1 },	-- Fix
	[ "Nimbus Hippogryph"		] = { 1 },	-- Fix
	[ "Strato Hippogryph"		] = { 1 },	-- Fix


	-- プーク族

	-- ブガード族
	[ "Bugard"					] = { 1 },	-- Fix
	[ "Gigantobugard"			] = { 1 },	-- Fix

	-- プギル族(釣り)
	[ "Beach Pugil"				] = { 0 },	-- Fix
	[ "Big Jaw"					] = { { [   0 ] = 1, [  27 ] = 0 } },	-- Fix
	[ "Canal Pugil"				] = { 1 },	-- Fix
	[ "Davoi Pugil"				] = { 1 },	-- Fix
	[ "Demonic Pugil"			] = { 1 },	-- Fix
	[ "Fatty Pugil"				] = { 0 },	-- Fix
	[ "Fosse Pugil"				] = { 0 },	-- Fix
	[ "Ghelsba Pugil"			] = { 1 },	-- Fix
	[ "Giant Pugil"				] = { { [   0 ] = 1, [   1 ] = 0 } },	-- Fix
	[ "Giddeus Pugil"			] = { 1 },	-- Fix
	[ "Greater Pugil"			] = { { [   0 ] = 1, [ 126 ] = 2 } },	-- Fix
	[ "Grotto Pugil"			] = { 1 },	-- Fix
	[ "Jagil"					] = { 0 },	-- Fix
	[ "Land Pugil"				] = { { [   0 ] = 1, [ 104 ] = 0, [   2 ] = 0, [ 109 ] = 0, [  82 ] = 2 } },	-- Fix
	[ "Makara"					] = { { [   0 ] = 1, [  27 ] = 2 } },	-- Fix
	[ "Pugil"					] = { { [   0 ] = 0, [ 140 ] = 1, [ 145 ] = 1 } },	-- Fix
	[ "Pug Pugil"				] = { { [   0 ] = 1, [ 116 ] = 0 } },	-- Fix
	[ "Razorjaw Pugil"			] = { 1 },	-- Fix
	[ "Sand Pugil"				] = { 1 },	-- Fix
	[ "Sea Pugil"				] = { 0 },	-- Fix
	[ "Shoal Pugil"				] = { 0 },	-- Fix
	[ "Spinous Pugil"			] = { 0 },	-- Fix
	[ "Stygian Pugil"			] = { { [   0 ] = 1, [  83 ] = 2 } },	-- Fix
	[ "Terror Pugil"			] = { 1 },	-- Fix

	-- フライ族
	[ "Crane Fly"				] = { 2 },	-- Fix
	[ "Damselfly"				] = { 2 },	-- Fix
	[ "Darter"					] = { 2 },	-- Fix
	[ "Dragonfly"				] = { { [   0 ] = 2, [ 197 ] = 3 } },	-- Fix
	[ "Gadfly"					] = { 2 },	-- Fix
	[ "Gallinipper"				] = { { [   0 ] = 3, [   7 ] = 2 } },	-- Fix
	[ "Goblin's Dragonfly"		] = { 0 },	-- Fix
	[ "Goblin's Gallinipper"	] = { 0 },	-- Fix
	[ "Goblin's Ogrefly"		] = { 0 },	-- Fix
	[ "Hawker"					] = { 2 },	-- Fix
	[ "Hornfly"					] = { 2 },	-- Fix
	[ "Madfly"					] = { 0 },	-- Fix
	[ "May Fly"					] = { 2 },	-- Fix
	[ "Monarch Ogrefly"			] = { 2 },	-- Fix
	[ "Ogrefly"					] = { 2 },	-- Fix
	[ "Sadfly"					] = { 2 },	-- Fix
	[ "Skimmer"					] = { 2 },	-- Fix

	-- フライトラップ族
	[ "Battrap"					] = { 0 },	-- Fix
	[ "Birdtrap"				] = { 0 },	-- Fix
	[ "Flytrap"					] = { 0 },	-- Fix
	[ "Hawkertrap"				] = { 0 },	-- Fix
	[ "Mantrap"					] = { 0 },	-- Fix

	-- フラン族

	-- フワボ族
	[ "Ul'phuabo"				] = { 1 },	-- Fix
	[ "Om'phuabo"				] = { 1 },	-- Fix

	-- ヘクトアイズ族
	[ "Blubber Eyes"			] = { { [   0 ] = 1, [   9 ] = 0 } },	-- Fix
	[ "Dodomeki"				] = { 1 },	-- Fix
	[ "Gazer"					] = { 1 },	-- Fix
	[ "Hecteyes"				] = { 1 },	-- Fix
	[ "Million Eyes"			] = { 1 },	-- Fix
	[ "Mindgazer"				] = { 1 },	-- Fix
	[ "Taisai"					] = { 1 },	-- Fix
	[ "Thousand Eyes"			] = { 1 },	-- Fix

	-- ベヒーモス族

	-- ペミデ族
	[ "Om'hpemde"				] = { 0 },	-- Fix
	[ "Ul'hpemde"				] = { 0 },	-- Fix

	-- ボム族
	[ "Ancient Bomb"			] = { 1 },	-- Fix
	[ "Azer"					] = { 1 },	-- Fix
	[ "Balloon"					] = { 1 },	-- Fix
	[ "Bifrons"					] = { 1 },	-- Fix
	[ "Bomb"					] = { 1 },	-- Fix
	[ "Enna-enna"				] = { 1 },	-- Fix
	[ "Explosure"				] = { 1 },	-- Fix
	[ "Feu Follet"				] = { 1 },	-- Fix
	[ "Fox Fire"				] = { 1 },	-- Fix
	[ "Glide Bomb"				] = { 1 },	-- Fix
	[ "Grenade"					] = { 1 },	-- Fix
	[ "Hellmine"				] = { 1 },	-- Fix
	[ "Ignis Fatuus"			] = { 1 },	-- Fix
	[ "Lava Bomb"				] = { 1 },	-- Fix
	[ "Napalm"					] = { 1 },	-- Fix
	[ "Puroboros"				] = { 1 },	-- Fix
	[ "Shrapnel"				] = { 1 },	-- Fix
	[ "Spunkie"					] = { 1 },	-- Fix
	[ "Teine Sith"				] = { 1 },	-- Fix
	[ "Volcanic Bomb"			] = { 1 },	-- Fix
	[ "Volcanic Gas"			] = { 1 },	-- Fix
	[ "Will-o'-the-Wisp"		] = { 1 },	-- Fix

	-- ボム族(クラスター)
	[ "Atomic Cluster"			] = { 1 },	-- Fix
	[ "Cluster"					] = { 1 },	-- Fix
	[ "Nitro Cluster"			] = { 1 },	-- Fix

	-- ポロッゴ族

	-- マーリド族

	-- マジックポット族
	[ "Aura Pot"				] = { 4 },	-- Fix
	[ "Clockwork Pod"			] = { 4 },	-- Fix
	[ "Demonic Millstone"		] = { 4 },	-- Fix
	[ "Droma"					] = { 4 },	-- Fix
	[ "Dustbuster"				] = { 4 },	-- Fix
	[ "Hover Tank"				] = { 4 },	-- Fix
	[ "Magic Flagon"			] = { 4 },	-- Fix
	[ "Magic Jar"				] = { 4 },	-- Fix
	[ "Magic Jug"				] = { 4 },	-- Fix
	[ "Magic Pot"				] = { 4 },	-- Fix
	[ "Magic Urn"				] = { 4 },	-- Fix
	[ "Magic Millstone"			] = { 4 },	-- Fix
	[ "Maledict Millstone"		] = { 4 },	-- Fix
	[ "Sprinkler"				] = { 4 },	-- Fix

	-- マムージャ族

	-- マメット族

	-- マンティコア族
	[ "Desert Manticore"		] = { 1 },	-- Fix
	[ "Greater Manticore"		] = { 1 },	-- Fix
	[ "Labyrinth Manticore"		] = { 1 },	-- Fix
	[ "Lesser Manticore"		] = { 1 },	-- Fix
	[ "Valley Manticore"		] = { 3 },	-- Fix

	-- マンドラゴラ族
	[ "Alraune"					] = { 2 },	-- Fix
	[ "Korrigan"				] = { 3 },	-- Fix
	[ "Mandragora"				] = { 0 },	-- Fix
	[ "Mourioche"				] = { 2 },	-- Fix
	[ "Puck"					] = { 3 },	-- Fix
	[ "Pygmaioi"				] = { 0 },	-- Fix
	[ "Sylvestre"				] = { 0 },	-- Fix
	[ "Tiny Mandragora"			] = { 0 },	-- Fix
	[ "Yhoator Mandragora"		] = { 0 },	-- Fix
	[ "Yuhtunga Mandragora"		] = { 0 },	-- Fix

	-- ミミック族
	[ "Archaic Chest"			] = { 1 },	-- Fix
	[ "Treasure Chest"			] = { 1 },	-- Fix

	-- メロー族

	-- モルボル族
	[ "Anemone"					] = { 1 },	-- Fix
	[ "Demonic Rose"			] = { 1 },	-- Fix
	[ "Malboro"					] = { 1 },	-- Fix
	[ "Morbol"					] = { { [   0 ] = 1, [  15 ] = 0 } },	-- Fix
	[ "Morbol Menace"			] = { 1 },	-- Fix
	[ "Lunantishee"				] = { 1 },	-- Fix
	[ "Ochu"					] = { 1 },	-- Fix
	[ "Overgrown Rose"			] = { { [   0 ] = 1, [  25 ] = 3 } },	-- Fix
	[ "Stroper"					] = { 1 },	-- Fix

	-- アムルタート・モルボル族

	-- ヤグード族
	[ "Yagudo Acolyte"			] = { 3 },	-- Fix
	[ "Yagudo Abbot"			] = { 3 },	-- Fix
	[ "Yagudo Assassin"			] = { 3 },	-- Fix
	[ "Yagudo Chanter"			] = { 3 },	-- Fix
	[ "Yagudo Conductor"		] = { 3 },	-- Fix
	[ "Yagudo Conquistador"		] = { 3 },	-- Fix
	[ "Yagudo Drummer"			] = { 3 },	-- Fix
	[ "Yagudo Flagellant"		] = { 3 },	-- Fix
	[ "Yagudo Herald"			] = { 3 },	-- Fix
	[ "Yagudo Initiate"			] = { 3 },	-- Fix
	[ "Yagudo Inquisitor"		] = { 3 },	-- Fix
	[ "Yagudo Interrogator"		] = { 3 },	-- Fix
	[ "Yagudo Lutenist"			] = { 3 },	-- Fix
	[ "Yagudo Mendicant"		] = { 3 },	-- Fix
	[ "Yagudo Persecutor"		] = { 3 },	-- Fix
	[ "Yagudo Oracle"			] = { 3 },	-- Fix
	[ "Yagudo Piper"			] = { 3 },	-- Fix
	[ "Yagudo Prelate"			] = { 3 },	-- Fix
	[ "Yagudo Priest"			] = { 3 },	-- Fix
	[ "Yagudo Prior"			] = { 3 },	-- Fix
	[ "Yagudo Scribe"			] = { 3 },	-- Fix
	[ "Yagudo Sentinel"			] = { 3 },	-- Fix
	[ "Yagudo Theologist"		] = { 3 },	-- Fix
	[ "Yagudo Votary"			] = { 3 },	-- Fix
	[ "Yagudo Zealot"			] = { 3 },	-- Fix

	-- ユブヒ族
	[ "Aern's Euvhi"			] = { 0 },	-- Fix
	[ "Aw'euvhi"				] = { { [   0 ] = 0, [  35 ] = 3 }, { [   0 ] = '☆', [  35 ] = '' } },	-- NM としても出現するので注意 Fix
	[ "Eo'euvhi"				] = { 3 },	-- Fix

	-- ヨヴラ族
	[ "Om'yovra"				] = { 1 },	-- Fix
	[ "Ul'yovra"				] = { 1 },	-- Fix

	-- ラプトル族
	[ "Deinonychus"				] = { 1 },	-- Fix
	[ "Eotyrannus"				] = { 1 },	-- Fix
	[ "Nival Raptor"			] = { 1 },	-- Fix
	[ "Raptor"					] = { 1 },	-- Fix
	[ "Sauromugue Skink"		] = { 1 },	-- Fix
	[ "Velociraptor"			] = { 1 },	-- Fix

	-- ラミア族

	-- リーチ族(釣り)
	[ "Acrophies"				] = { 2 },	-- Fix
	[ "Bleeder Leech"			] = { 2 },	-- Fix
	[ "Blood Ball"				] = { 2 },	-- Fix
	[ "Bloodsucker"				] = { { [   0 ] = 1, [ 169 ] = 3, [ 167 ] = 3 } },	-- Fix
	[ "Bouncing Ball"			] = { { [   0 ] = 1, [ 169 ] = 3 } },	-- Fix
	[ "Forest Leech"			] = { 2 },	-- Fix
	[ "Gigas's Leech"			] = { 0 },	-- Fix
	[ "Goblin's Leech"			] = { 0 },	-- Fix
	[ "Goobbue Parasite"		] = { 2 },	-- Fix
	[ "Labyrinth Leech"			] = { 2 },	-- Fix
	[ "Leech"					] = { 2 },	-- Fix
	[ "Poison Leech"			] = { { [  0 ] = 2, [ 193 ] = 3 } },	-- Fix
	[ "Royal Leech"				] = { 2 },	-- Fix
	[ "Sahagin Parasite"		] = { 2 },	-- Fix
	[ "Stickpin"				] = { 2 },	-- Fix
	[ "Thread Leech"			] = { { [   0 ] = 1, [ 193 ] = 2, [ 109 ] = 2, [ 103 ] = 2, [ 173 ] = 2, [  90 ] = 2 } },	-- Fix
	[ "Yagudo Parasite"			] = { 3 },	-- Fix
	[ "Wadi Leech"				] = { 2 },	-- Fix

	-- ロック族
	[ "Abraxas"					] = { 3 },	-- Fix
	[ "Diatryma"				] = { { [   0 ] = 1, [  25 ] = 2 } },
	[ "Lesser Roc"				] = { 2 },	-- Fix
	[ "Peryton"					] = { 1 },	-- Fix
	[ "Phorusrhacos"			] = { 3 },	-- Fix

	-- ワーム族
	[ "Abyss Worm"				] = { 3 },	-- Fix
	[ "Amphisbaena"				] = { 3 },	-- Fix
	[ "Carrion Worm"			] = { 0 },	-- Fix
	[ "Cave Worm"				] = { 2 },	-- Fix
	[ "Desert Worm"				] = { 1 },	-- Fix
	[ "Dirt Eater"				] = { 1 },	-- Fix
	[ "Earth Eater"				] = { 3 },	-- Fix
	[ "Flesh Eater"				] = { { [   0 ] = 2, [ 114 ] = 1 } },	-- Fix
	[ "Giant Grub"				] = { 1 },	-- Fix
	[ "Glacier Eater"			] = { 2 },	-- Fix
	[ "Kuftal Digger"			] = { 2 },	-- Fix
	[ "Land Worm"				] = { { [   0 ] = 2, [ 126 ] = 3 } },	-- Fix
	[ "Maze Maker"				] = { 2 },	-- Fix
	[ "Mountain Worm"			] = { 2 },	-- Fix
	[ "Ore Eater"				] = { 2 },	-- Fix
	[ "Rock Eater"				] = { { [   0 ] = 2, [  88 ] = 0, [  89 ] = 0, [ 190 ] = 1 } },	-- Fix
	[ "Rockmill"				] = { 0 },	-- Fix
	[ "Sand Digger"				] = { 3 },	-- Fix
	[ "Sand Eater"				] = { 2 },	-- Fix
	[ "Stone Eater"				] = { { [   0 ] = 0, [ 190 ] = 1 } },	-- Fix
	[ "Tomb Worm"				] = { 0 },	-- Fix
	[ "Tunnel Worm"				] = { 0 },	-- Fix
	[ "Ziryu"					] = { 1 },	-- Fix

	-- ワイバーン族
	[ "Firedrake"				] = { 1 },	-- Fix
	[ "Flamedrake"				] = { 1 },	-- Fix
	[ "Hurricane Wyvern"		] = { 1 },	-- Fix
	[ "Ignidrake"				] = { 1 },	-- Fix
	[ "Ladon"					] = { 1 },	-- Fix
	[ "Pyrodrake"				] = { 1 },	-- Fix
	[ "Typhoon Wyvern"			] = { 1 },	-- Fix
	[ "Wyvern"					] = { 1 },	-- Fix

	-- ワモーラ族(成虫)

	-- ワモーラ族(幼虫)

	-- ワンダラー族
	[ "Stray"					] = { 1 },		-- Fix
	[ "Wanderer"				] = { 1 },		-- Fix

	-----------------------------------------------------------
	-- その他

	-- 子竜
	[ "Aern's Wynav"			] = { 0 },		-- Fix
	[ "Fomor's Wyvern"			] = { 0 },		-- Fix

	-- メモリーレセプタクル
	[ "Memory Receptacle"		] = { 0 },		-- Fix

	-------------------------------------------------------------------------------------------
	-- ノートリアスモンスター


	-- アーリマン族
	[ "Shadow Eye"				] = { 1, '★'	},	-- Lv.49

	-- アーン族

	-- アダマンタス族

	-- アプカル族

	-- アルテマ族

	-- アンティカ族

	-- アントリオン族

	-- イビルウェポン族
	[ "Juggler Hecatomb"		] = { 1, '★'	},	-- Lv.47
	[ "Prankster Maverix"		] = { 1, '★'	},
	
	-- インプ族

	-- ウィーバー族

	-- ウィヴル族

	-- ウィルム族

	-- ウサギ族

	-- ウラグナイト族

	-- エフト族

	-- エレメンタル族

	-- オーク族

	-- オークの戦闘機械

	-- 大羊族

	-- カラクール・大羊族

	-- 大羊族(雄羊)

	-- オポオポ族

	-- オメガ族

	-- オロボン族

	-- カーディアン族

	-- キキルン族

	-- キノコ族

	-- キマイラ族

	-- 巨人族

	-- クァール族

	-- グゥーブー族

	-- クゥダフ族
	[ "De'Vyu Headhunter"		] = { 3, '☆'	},	-- Lv.45
	[ "Go'Bhu Gascon"			] = { 3, '☆'	},	-- Lv.41

	-- クトゥルブ族

	-- クラブ族

	-- クレイヴァー族

	-- クロウラー族
	[ "Spiny Spipi"				] = { 0, '☆'	},

	-- エルカ・クロウラー族

	-- ケルベロス族

	-- 剣虎族

	-- 甲虫族

	-- コウモリ族(1匹)
	[ "Old Two-Wings"			] = { 3, '★'	},	-- Lv.52

	-- コウモリ族(3匹)

	-- ゴージャー族

	-- コース族

	-- ゴースト族
	[ "Sluagh"					] = { 1, '★'	},	-- Lv.78

	-- ブフート・ゴースト族

	-- ゴーレム族

	-- コカトリス族
	[ "Skewer Sam"				] = { 1, '★'	},	-- Lv.54

	-- ジズ・コカトリス族

	-- ゴブリン族

	-- ゴブリン族(バグベア)

	-- ゴブリン族(モブリン)

	-- ゴラホ族

	-- コリブリ族

	-- サソリ族

	-- サハギン族

	-- サボテンダー族

	-- シーザー族

	-- 屍犬族

	-- 死鳥族

	-- シャドウ族
	[ "Doppelganger Dio"		] = { 1, '★'	},		-- Lv.23

	-- シャドウ族(フォモル)

	-- 樹人族
	[ "Fraelissa"				] = { 1, '★'	},

	-- 樹人族(若木)
	[ "Sappy Sycamore"			] = { 2, '★' },			-- Lv.41

	-- シンカー族

	-- スケルトン族

	-- ドラウガー・スケルトン族

	-- スノール族

	-- スパイダー族

	-- スフィアロイド族

	-- スライム族

	-- ゼデー族

	-- ソウルフレア族

	-- ゾミト族

	-- ダイアマイト族

	-- タウルス族

	-- ダルメル族

	-- チゴー族

	-- デーモン族

	-- ドゥーム族
	[ "Frogamander"				] = { 1, '★' },		-- Lv.72

	-- 頭足族

	-- ドール族
	[ "Autarch"					] = { 4, '★'	},	-- Lv.84

	-- トカゲ族

	-- ドラゴン族

	-- ダハク・ドラゴン族

	-- トロール族

	-- トンベリ族

	-- ハイドラ族

	-- 蜂族

	-- バッファロー族

	-- ヒッポグリフ族

	-- プーク族

	-- ブガード族

	-- プギル族
	[ "Qoofim"					] = { 2, '★' },		-- lv.47

	-- フライ族

	-- フライトラップ族

	-- フラン族
	[ "Botulus Rex"				] = { 1, '★' },		-- lv.95

	-- フワボ族

	-- ヘクトアイズ族

	-- ベヒーモス族

	-- ペミデ族

	-- ボム族

	-- ボム族(クラスター)

	-- ポロッゴ族

	-- マーリド族

	-- マジックポット族

	-- マムージャ族

	-- マメット族

	-- マンティコア族

	-- マンドラゴラ族

	-- ミミック族

	-- メロー族

	-- モルボル族
	[ "Toxic Tamlyn"			] = { 1, '★'	},	-- Lv.45

	-- アムルタート・モルボル族

	-- ヤグード族
	[ "Eyy Mon the Ironbreaker"	] = { 3, '☆'	},	-- Lv.16
	[ "Lii Jixa the Somnolist"	] = { 3, '☆'	},	-- Lv.25
	[ "Quu Xijo the Illusory"	] = { 3, '★'	},	-- Lv.25
	[ "Yagudo High Priest"		] = { 3, '★'	},	-- Lv.25
	[ "Zhuu Buxu the Silent"	] = { 3, '☆'	},	-- Lv.16

	-- ユブヒ族

	-- ヨヴラ族

	-- ラプトル族

	-- ラミア族

	-- リーチ族

	-- ロック族

	-- ワーム族

	-- ワイバーン族

	-- ワモーラ族(成虫)

	-- ワモーラ族(幼虫)

	-- ワンダラー族
	



	[ "Adamantoise"				] = { 1, '★★' },
	[ "Ash Dragon"				] = { 1, '★★' },
	[ "Aspidochelone"			] = { 1, '★★★' },
	[ "Absolute Virtue"			] = { 1, '★★★☆' },


	[ "Behemoth"				] = { 1, '★★'	},
	[ "Brigandish Blade"		] = { 1, '★☆'	},
	[ "Bune"					] = { 1, '★★'	},
	[ "Byakko"					] = { 1, '★★'	},

	[ "Capricious Cassie"		] = { 1, '★★'	},
	[ "Cemetery Cherry"			] = { 1, '★★'	},
	[ "Cerberus"				] = { 1, '★★★'	},
	
	[ "Dark Ixion"				] = { 1, '★★'	},
	[ "Despot"					] = { 1, '★☆'	},

	[ "Fafnir"					] = { 1, '★★'	},
	[ "Faust"					] = { 1, '★☆'	},

	[ "Genbu"					] = { 1, '★★'	},

	[ "Hydra"					] = { 1, '★★★'	},

	[ "Jailer of Faith"			] = { 1, '★★☆'	},
	[ "Jailer of Fortitude"		] = { 1, '★★☆'	},
	[ "Jailer of Hope"			] = { 1, '★★☆'	},
	[ "Jailer of Justice"		] = { 1, '★★☆'	},
	[ "Jailer of Love"			] = { 1, '★★☆'	},
	[ "Jailer of Prudencee"		] = { 1, '★★☆'	},
	[ "Jailer of Temperance"	] = { 1, '★★☆'	},
	[ "Jormungand"				] = { 1, '★★★'	},

	[ "Khimaira"				] = { 1, '★★★'	},
	[ "King Arthro"				] = { 1, '★★'	},
	[ "King Behemoth"			] = { 1, '★★★'	},
	[ "King Vinegarroon"		] = { 1, '★★'	},
	[ "Kirin"					] = { 1, '★★★'	},
	[ "Kouryu"					] = { 1, '★★★'	},
	
	[ "Lumber Jack"				] = { 1, '★★'	},
	
	[ "Mother Globe"			] = { 1, '★☆'	},

	[ "Nidhogg"					] = { 1, '★★★'	},


	[ "Olla Grande"				] = { 1, '★☆'	},
	[ "Olla Media"				] = { 1, '★'	},
	[ "Olla Pequena"			] = { 1, '★'	},


	[ "Roc"						] = { 1, '★★'	},

	[ "Sandworm"				] = { 1, '★★'	},
	[ "Seiryu"					] = { 1, '★★'	},
	[ "Serket"					] = { 1, '★★'	},
	[ "Simurgh"					] = { 1, '★★'	},
	[ "Steam Cleaner"			] = { 1, '★☆'	},
	[ "Suzaku"					] = { 1, '★★'	},

	[ "Tiamat"					] = { 1, '★★★'	},

	[ "Ullikummi"				] = { 1, '★☆'	},

	[ "Vrtra"					] = { 1, '★★★'	},

	[ "Zipacna"					] = { 1, '★☆'	},

}

return Nms


