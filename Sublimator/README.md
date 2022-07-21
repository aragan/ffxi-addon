# Sublimator
Simple addon to manage sublimation.   
Will keep sublimation up any time isn't and use it when MP falls below a chosen percentage or set amount missing.   
Can be set to only fill MP after charging is complete, a chosen number of seconds has passed since starting, or now.  
Settings are save based on main job.  
~~Automatically turns off when zoning or changing jobs, don't forget to turn it back on.~~  
Only uses Sublimation outside of cities (Sandy, Windy, Bastok, WG, etc.). Mhaura and other small zones will still be used.  
Only refills MP during combat at present.  
  
## Command: sublimator or sublimate
no argument - toggles sublimation management  
- show - Display current settings
- start|stop - starts|stops sublimation management  
- save - saves current settings for main job  
- help - shows some help text  
- mpp - sets MP percent to use sublimation at or below  
- mising - sets amount of missing mp to use sublimation at or below  
- full [true|false] - sets (toggles if no option given) whether or not to always wait for full charge  
- charge - sets the seconds before sublimation can be used, when full is not on
  - Default 300 seconds (5 mins)
- zone - toggles disabling when zoning
  - Default off  
- verbose - toggles extra info  

TODO:
- [ ] Add checks for status effects (Stun, Para, Amnesia, etc.) so we don't spam the JA
- [X] Make a toggle for disabling when zoning or not
