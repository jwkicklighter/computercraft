IntPrint = function(n, mon)
  n = math.floor(n)
  mon.write(n)
  x,y = mon.getCursorPos()
  mon.setCursorPos(x-2, y)
  mon.write("  ")
  mon.setCursorPos(x-2, y)
end

GetIngotCounts = function()
  local ae = peripheral.wrap("tileenergyacceptor_0")
  local items = ae.getAvailableItems()

  local yCount = 0
  local cCount = 0

  for key,item in pairs(items) do
    if string.match(item.fingerprint.id, "BigReactors") then
      if item.fingerprint.dmg == 0 then
        yCount = item.size
      elseif item.fingerprint.dmg == 1 then
        cCount = item.size
      end
    end
  end

  return yCount,cCount
end

while true do
  local mon = peripheral.wrap("monitor_3")

  local negativeColor = colors.red
  local normalColor = colors.lime
  local uiColor = colors.white

  local yCount, cCount = GetIngotCounts()

  mon.clear()
  mon.setTextScale(0.5)

  mon.setCursorPos(3,1)
  mon.setTextColor(uiColor)
  mon.write("Ingot Count")

  mon.setCursorPos(1,4)
  mon.setTextColor(uiColor)
  mon.write("Yellorium: ")
  if yCount > 0 then
    mon.setTextColor(normalColor)
  else
    mon.setTextColor(negativeColor)
  end
  IntPrint(yCount,mon)

  mon.setCursorPos(1,6)
  mon.setTextColor(uiColor)
  mon.write("Cyanite:   ")
  if cCount > 0 then
    mon.setTextColor(normalColor)
  else
    mon.setTextColor(negativeColor)
  end
  IntPrint(cCount,mon)
end
