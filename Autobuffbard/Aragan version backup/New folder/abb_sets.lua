bff_sets = {};

-- ************************************************************************************* --
-- Author: Aragan (Asura)
-- DEFINE YOUR SETS HERE, SECOND SONG GETS MARCATO (SO WE DONT OVWRITE IT WITH PIANISSIMO)
-- EVERY SET NAME MUST BE LOWERCASE
bff_sets.haste2 = {'Valor Minuet IV', 'Honor March', 'Valor Minuet V',  'Blade Madrigal', "Knight's Minne V"}
bff_sets.aria2 = {'Valor Minuet IV', 'Honor March',  "Aria of Passion", 'Valor Minuet V', 'Blade Madrigal'}
bff_sets.sherzo = {'Valor Minuet IV', 'Honor March', 'Valor Minuet V', "Sentinel's Scherzo", 'Blade Madrigal'}
bff_sets.haste2acc = {'Valor Minuet IV', 'Honor March', 'Valor Minuet V', 'Blade Madrigal', "Sword Madrigal"}
bff_sets.haste1 = {'Valor Minuet IV', 'Honor March', 'Valor Minuet V', 'Victory March', "Blade Madrigal"}
bff_sets.aria1 = {'Valor Minuet IV', 'Honor March',  "Aria of Passion", 'Valor Minuet V', 'Victory March'}
bff_sets.sheol = {'Blade Madrigal', 'Honor March', 'Victory March', "Valor Minuet IV", "Valor Minuet V"}
bff_sets.acc = {'Blade Madrigal', 'Honor March', 'Valor Minuet IV', 'Victory March', 'Valor Minuet V'}
bff_sets.fire = {'Blade Madrigal', 'Honor March', 'Valor Minuet V', 'Fire Carol', 'Fire Carol II'}
bff_sets.magic = {'Blade Madrigal', 'Honor March', 'Logical Etude', "Sage Etude", "Sentinel's Scherzo"}
bff_sets.skill = {'Blade Madrigal', 'Honor March', 'Sword Madrigal', "Victory March", "Sentinel's Scherzo"}
bff_sets.seg = {'Blade Madrigal', 'Honor March', 'Victory March', "Valor Minuet IV", "Valor Minuet V"}
bff_sets.ph = {"Adventurer's Dirge","Warding Round","Puppet's Operetta","Goddess's Hymnus","Shining Fantasia"}
--Odyssey V25 ADD BY Author: Aragan (Asura)
bff_sets.mboze = {'Valor Minuet III', 'Honor March', 'Valor Minuet II', 'Valor Minuet IV', 'Valor Minuet V'}
--[[MBOZE PLAN BRD: SV Honor March, Minuet x4. HM/Minnes/Ballads for PLD and WHM. 
WHM will not be taking much damage at all here, 
but it was easier for us to apply the Ballads to both PLD and WHM at the same time. Savage Blade. ]]
bff_sets.xevioso = {"Sentinel's Scherzo", 'Honor March', 'Valor Minuet IV', 'Valor Minuet V', "Wind Carol II"}
--BRD: Honor March, Scherzo, Minuet x2, Wind Carol 1 for frontline, Honor March, Ballad x2, Minne x2 for WHM.
-- Melee with Rudra's/Evisceration during aura. Apply Carnage Elegy/Pining Nocturne. 
bff_sets.kalunga = {"Adventurer's Dirge", 'Honor March', 'Valor Minuet IV', 'Valor Minuet V', 'Fire Carol II'}
--[[BRD: Sing slow SV songs at the start. HM Dirge Minuet x2 Fire Carol 1 for melees. Sirvente and Ballad3 the PLD. Ballad 3 / 2 the WHM. Nitro before SV wears so songs last the whole fight.
Savage Blade. Don't spend a ton of time rebuffing the PLD, this DPS check sucks. ]]
bff_sets.ngai = {"Sentinel's Scherzo", 'Honor March', 'Valor Minuet IV', 'Valor Minuet V', 'Water Carol II'}
--[[BRD: SV Honor March, Minuet x2, Scherzo, Water Carol2 (on MNK WAR)
Honor March, Scherzo, Minne, Water Carol2, Ballad (on WHM COR BRD) ]]
bff_sets.arebati = {'Valor Minuet III', 'Honor March', 'Valor Minuet IV', 'Valor Minuet V', 'Valor Minuet II'}
--[[BRD: Minuet x4, Honor March (on everyone else)
Dirge, Honor March, Ballad, Minne x2 (on PLD)
COR need Scherzo ]]
bff_sets.ongo = {'Victory March', 'Sage Etude', 'Learned Etude', "Mage's Ballad III", "Mage's Ballad II"}
--[[BRD: SV Victory March, Ballad x2, INT Etude x2 (on everyone)
Minne x3, Paeon, Sirvente (on BRD) ]]
bff_sets.Bumba = {"Sentinel's Scherzo", 'Honor March', 'Valor Minuet IV', 'Valor Minuet V', 'Valor Minuet III'}
--[[BRD: BRD: SV Scherzo, Honor March, Minuet x3]]


--PIANISSIMO TARGET (ONLY ONE ATM, i.e. BALLAD FOR HEALER)
--bff_pianissimo = {['Aragan']= "Mage's Ballad III", ['Anitamaru']= "Mage's Ballad III"}
--bff_pianissimo = {['Xenodeus']= "Mage's Ballad III"}
--bff_pianissimo = {['Limaru']= "Mage's Ballad III"}
--bff_pianissimo = {['Spatz']= "Mage's Ballad III"}
--bff_pianissimo = "Mage's Ballad III"
--bff_pianissimo = {"Mage's Ballad III"}

bff_pianissimo = {}
bff_pianissimo_sets = {}
bff_pianissimo_sets.refresh = {"Mage's Ballad III"}

--PLACEHOLDER FOR BUFFING
--bff_ph_song = "Adventurer's Dirge"
bff_ph_songs = {'Herb Pastoral'}
bff_ph_cc_song = "Adventurer's Dirge" --Clarion Call song

-- END OF CUSTOM STUFF
-- ************************************************************************************ --