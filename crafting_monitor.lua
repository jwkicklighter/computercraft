function intprint(n, mon)
  n = math.floor(n)
  mon.write(n)
  x,y = mon.getCursorPos()
  mon.setCursorPos(x-2, y)
  mon.write("  ")
  mon.setCursorPos(x-2, y)
end

while true do
  local mon = peripheral.wrap("monitor_2")
  local ae = peripheral.wrap("tileenergyacceptor_0")
  
  local activeColor = colors.red
  local inactiveColor = colors.lime
  local uiColor = colors.white

  mon.clear()
  mon.setTextScale(0.5)

  mon.setCursorPos(1,1)
  mon.setTextColor(colors.white)
  mon.write("Crafting Status")

  local cpuTable = ae.getCraftingCPUs()
  local cpuCount = cpuTable

  for key,value in pairs(cpuTable) do
    mon.setCursorPos(2, 1+key*2)
    mon.setTextColor(uiColor)
    mon.write("CPU ")
    intprint(key, mon)
    mon.write(": ")

    local cText = ""
    if cpuTable[key].busy then
      mon.setTextColor(activeColor)
      cText = "busy"
    else
      mon.setTextColor(inactiveColor)
      cText = "free"
    end

    mon.write(cText)

  end

  sleep(5)
end
