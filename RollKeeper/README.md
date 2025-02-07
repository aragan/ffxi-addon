# Roll Keeper - /random tracking

**Author:**  Kosumi (Asura)<br>
**Version:**  1.0<br>
**Date:** December 5, 2022<br>

## Description

Windower addon for monitoring, tracking and sorting dice rolls (/random) for your aliance. Roll Keeper will only keep track of rolls of people in your party/aliance. Players who have not yet rolled are shown. Duplicate rolls from the same player will be put in a seperate list under the main list.

Features include being able to automatically sorting the list by roll and the ability to manually add, change or remove rolls from the list.

![](images/preview.png)

## Usage

* Type `//lua l rollkeeper` to load or add to your init.txt file.
* Tracking is on by default when you load, you can toggle tracking using `//rk on` and `//rk off`

## Commands
1. **on/off** - Toggles turning roll tracking on or off, does not clear any existing data.
2. **add {name} {roll}** - Manually adds the player name and roll number to the roll list. Name should be the full name and roll should be a number between 0 and 999. If the player name is already in the list it will remove the old roll and add the new one.
3. **remove {name}** - Removes player roll from list
4. **dupe** - Clears only the duplicate roll list
5. **reset** - Clears all data
6. **help** - Displays help.
	
### Example Commands
```
//rk on
//rk add Kosumi 555
//rk remove Kosumi 
//rk reset
//rk off
```
