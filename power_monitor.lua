TogglePower=function()
  local reactor1 = peripheral.wrap("BigReactors-Reactor_1")
  local batt1 = peripheral.wrap("tile_thermalexpansion_cell_hardened_name_0")
  local batt2 = peripheral.wrap("tile_thermalexpansion_cell_hardened_name_1")
  local batt3 = peripheral.wrap("tile_thermalexpansion_cell_hardened_name_2")

  local rActive = reactor1.getActive()

  local energyStored = batt1.getEnergyStored() + batt2.getEnergyStored() + batt3.getEnergyStored()
  local energyCap = 2000000 * 3

  local energyPercentage = energyStored / energyCap

  if rActive then
    if energyPercentage > 0.95 then
      reactor1.setActive(false)
    end
  else
    if energyPercentage < 0.2 then
      reactor1.setActive(true)
    end
  end
end

while true do
  local reactor1 = peripheral.wrap("BigReactors-Reactor_1")
  local mon = peripheral.wrap("monitor_1")

  local rActive = reactor1.getActive()
  local rColor = colors.gray
  local rPowerStr = "off"

  local batt1 = peripheral.wrap("tile_thermalexpansion_cell_hardened_name_0")
  local batt2 = peripheral.wrap("tile_thermalexpansion_cell_hardened_name_1")
  local batt3 = peripheral.wrap("tile_thermalexpansion_cell_hardened_name_2")
  local energyStored = batt1.getEnergyStored() + batt2.getEnergyStored() + batt3.getEnergyStored()
  local energyCap = 2000000 * 3
  local energyPercentage = energyStored / energyCap
  local energyPercentageDisp = math.floor(energyPercentage * 100)

  if (rActive) then
    rColor = colors.lime
    rPowerStr = "on"
  end

  TogglePower()

  mon.clear()

  mon.setCursorPos(9,1)
  mon.setTextColor(colors.white)
  mon.write("Power Metrics")

  mon.setCursorPos(1,3)
  mon.setTextColor(colors.white)
  mon.write("Reactor: ")
  mon.setTextColor(rColor)
  mon.write(rPowerStr)

  mon.setCursorPos(1,4)
  mon.setTextColor(colors.white)
  mon.write("RF/T:    ")
  mon.setTextColor(rColor)
  mon.write(math.floor(reactor1.getEnergyProducedLastTick()))

  mon.setCursorPos(1,5)
  mon.setTextColor(colors.white)
  mon.write("RF:      ")
  mon.setTextColor(rColor)
  mon.write(energyPercentageDisp)
  mon.write("%")

  mon.setCursorPos(18,3)
  mon.setTextColor(colors.white)
  mon.write("Heat Levels")

  mon.setCursorPos(17,4)
  mon.setTextColor(colors.white)
  mon.write("Casing: ")
  mon.setTextColor(rColor)
  mon.write(math.floor(reactor1.getCasingTemperature()))

  mon.setCursorPos(17,5)
  mon.setTextColor(colors.white)
  mon.write("Fuel:   ")
  mon.setTextColor(rColor)
  mon.write(math.floor(reactor1.getFuelTemperature()))

  sleep(5)
end
