# computercraft
Miscellaneous scripts for the Computercraft Minecraft mod

## Description of Scripts

### crafting_monitor.lua
The crafting monitor is meant to use 1 Computercraft Advanced Monitor and expects a modem to be connected to an Applied Energistics system. It displays the current crafting status (busy/free) of each AE Crafting Processor on the system.

### power_monitor.lua
The power monitor uses 1 line of 3 Computercraft Advanced Monitors (connected horizontally) and expects a reactor and 3 Hardened Energy Cells. It displays some helpful metrics like the stored RF (% of total capacity), the power status of the reactor, etc.

As a bonus, power monitor also activates/deactivates the reactor at < 20% power or > 95% power respectively.
