Attach = {}
NA=0
NAttach = {}
NAttach["Light"] = 14
NAttach["Fire"] = 15
NAttach["Wind"] = 14


MAN = {"Light", "Fire", "Wind"}
--MAN[1] = "Fire"
--MAN[2] = "Light"

Attach["Light"] = {"Arcanic Cell", "Arcanic Cell II", "Auto-Repair Kit", "Auto-Repair Kit II", "Auto-Repair Kit III", "Auto-Repair Kit IV", "Damage Gauge", "Damage Gauge II", "Eraser", "Flashbulb", "Optic Fiber", "Optic Fiber II", "Vivi-Valve", "Vivi-Valve II"}
Attach["Light"]["Arcanic Cell"] = {"Occult Acumen", 10, 20, 35, 50, "Int"}
Attach["Light"]["Arcanic Cell II"] = {"Occult Acumen", 20, 40, 70, 100, "Int"}
Attach["Light"]["Auto-Repair Kit"] = {"Regen", 0, 0.00125, 0.00225, 0.00375, "%"}
Attach["Light"]["Auto-Repair Kit"].Special = {"Regen", 0, 1, 2, 3, "Int"}
Attach["Light"]["Auto-Repair Kit II"] = {"Regen", 0, 0.006, 0.012, 0.018, "%"}
Attach["Light"]["Auto-Repair Kit II"].Special = {"Regen", 0, 3, 6, 9, "Int"}
Attach["Light"]["Auto-Repair Kit III"] = {"Regen", 0, 0.018, 0.024, 0.03, "%"}
Attach["Light"]["Auto-Repair Kit III"].Special = {"Regen", 0, 9, 12, 15, "Int"}
Attach["Light"]["Auto-Repair Kit II"] = {"Regen", 0, 0.03, 0.036, 0.042, "%"}
Attach["Light"]["Auto-Repair Kit II"].Special = {"Regen", 0, 15, 18, 21, "Int"}
Attach["Light"]["Damage Gauge"] = {"Inknown", 0, 0, 0, 0, "%"}
Attach["Light"]["Damage Gauge II"] = {"Inknown", 0, 0, 0, 0, "%"}
Attach["Light"]["Eraser"] = {"Erase", 0, 1, 2, 3, "Int"}
Attach["Light"]["Flashbulb"] = {"Flash", "No effect", "Activable", "Activable", "Activable", "String"}
Attach["Light"]["Optic Fiber"] = {"Awesomeness", 0.1, 0.2, 0.25, 0.30, "%"}
Attach["Light"]["Optic Fiber II"] = {"Awesomeness", 0.15, 0.3, 0.375, 0.45, "%"}
Attach["Light"]["Vivivalve"] = {"Cure Pot", 0.05, 0.15, 0.3, 0.45, "%"}
Attach["Light"]["Vivivalve II"] = {"Cure Pot", 0.10, 0.20, 0.35, 0.50, "%"}

Attach["Fire"] = {"Attuner", "Flame Holder", "Heat Capacitor", "Heat Capacitor II", "Inhibitor", "Inhibitor II", "Reactive Shield", "Speedloader", "Speedloader II", "Strobe", "Strobe II", "Tension Spring", "Tension Spring II", "Tension Spring III", "Tension Spring IV"}

Attach["Fire"]["Attuner"] = {"Def Ignored", 0.05, 0.15, 0.3, 0.45, "%"}
Attach["Fire"]["Flame Holder"] = {"TP Bonus", 0.25, 1, 1.75, 2.5, "%"}
Attach["Fire"]["Heat Capacitor"] = {"Restore TP", 0, 400, 800, 1200, "Int"}
Attach["Fire"]["Heat Capacitor II"] = {"Restore TP", 0, 600, 1200, 1800, "Int"}
Attach["Fire"]["Inhibitor"] = {"Store TP", 5, 15, 25, 40, "Int"}
Attach["Fire"]["Inhibitor II"] = {"Store TP", 10, 25, 40, 65, "Int"}
Attach["Fire"]["Reactive Shield"] = {"Blaze Spike", "No effect", "Activable", "Activable", "Activable", "String"}
Attach["Fire"]["Speedloader"] = {"Skillchain Dmg", 0.1, 0.3, 0.4, 0.6, "%"}
Attach["Fire"]["Speedloader II"] = {"Skillchain Dmg", 0.15, 0.45, 0.6, 0.8, "%"}
Attach["Fire"]["Strobe"] = {"Enmity", 10, 25, 40, 60, "Int"}
Attach["Fire"]["Strobe II"] = {"Enmity", 20, 40, 65, 100, "Int"}
Attach["Fire"]["Tension Spring"] = {"Attack", 0.03, 0.06, 0.09, 0.12, "%"}
Attach["Fire"]["Tension Spring II"] = {"Attack", 0.06, 0.09, 0.12, 0.15, "%"}
Attach["Fire"]["Tension Spring III"] = {"Attack", 0.12, 0.15, 0.18, 0.21, "%"}
Attach["Fire"]["Tension Spring IV"] = {"Attack", 0.15, 0.18, 0.21, 0.24, "%"}


-------------------- Wind

Attach["Wind"] = {"Accelerator", "Accelerator II", "Accelerator III", "Accelerator IV", "Barrage Turbine", "Drum Magazine", "Pattern Reader", "Repeater", "Replicator", "Scope", "Scope II", "Scope III", "Turbo Charger", "Turbo Charger II"}
Attach["Wind"]["Accelerator"] = {"Evasion", 5, 10, 15, 20, "Int"}
Attach["Wind"]["Accelerator II"] = {"Evasion", 10, 15, 20, 25, "Int"}
Attach["Wind"]["Accelerator III"] = {"Evasion", 20, 35, 40, 50, "Int"}
Attach["Wind"]["Accelerator IV"] = {"Evasion", 30, 45, 60, 80, "Int"}
Attach["Wind"]["Barrage Turbine"] = {"Barrage", 0, 2, 3, 4, "Int"}
Attach["Wind"]["Drum Magazine"] = {"Snapshot", 3, 6, 9, 15, "Int"}
Attach["Wind"]["Pattern Reader"] = {"Inknown", 0, 0, 0, 0, "Int"}
Attach["Wind"]["Repeater"] = {"Double Shot", 0.1, 0.15, 0.35, 0.65, "%"}
Attach["Wind"]["Replicator"] = {"Blink", 0, 3, 7, 10, "Int"}
Attach["Wind"]["Scope"] = {"RAcc", 10, 20, 30, 40, "Int"}
Attach["Wind"]["Scope II"] = {"RAcc", 20, 30, 40, 50, "Int"}
Attach["Wind"]["Scope III"] = {"RAcc", 30, 40, 55, 70, "Int"}
Attach["Wind"]["Turbo Charger"] = {"Haste", 0.05, 0.15, 0.20, 0.25, "%"}
Attach["Wind"]["Turbo Charger II"] = {"Haste", 0.07, 0.17, 0.28, 0.4375, "%"}


Effect = {"Haste", "Snashot", "Store TP", "Def Ignored", "Skillchain Dmg", "RAcc", "Evasion", "Double Shot", "Enmity", "TP Bonus"}
NEffect = 10