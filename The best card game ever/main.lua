-- Nathan Skinner
-- CMPM 121 
-- 5-14-2025

io.stdout:setvbuf("no")
require "card"
require "powers"
require "vector"
require "area"
require "templates"
require "click"
require "game"
require "ai"

function love.load()
  love.window.setTitle("RatSoftware")
  screenWidth = 960
  screenHeight = 960
  love.window.setMode(screenWidth, screenHeight)
  
  delay = false
 r = love.graphics.newImage("Assets/volcano.png")
 g = love.graphics.newImage("Assets/grass.png")
 b = love.graphics.newImage("Assets/water.jpg")

time = 0
  
  midY = screenHeight / 2
  arrowSize = 40
  arrowMargin = 20
  lilFont = love.graphics.newFont(10)
  bigFont = love.graphics.newFont(18)
  toReveal ={}
  start()
end


function love.update()
  
  if #toReveal>0 then
    if love.timer.getTime()>time then
    revealC(toReveal[1])
    table.remove(toReveal,1)
    time =love.timer.getTime()+1
    end
  end
  if #toReveal==0 and turnHelper==true then
    turnHelper=false
    finishTurn()
    end
  moveCards()
end

function love.draw()
  -- Draws current area
  areas[state]:draw()
  for i, card in ipairs(aHand) do
    card:draw()
    end
  -- Draws mouse pos
  local x, y = love.mouse.getPosition()
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Mouse: " .. x .. ", " .. y, 10, 10)
  endTurnBtn = {
  x = screenWidth - 150,
  y = screenHeight - 100,
  w = 120,
  h = 50
}
-- Draw End Turn button
love.graphics.setColor(0.2, 0.2, 0.2)
love.graphics.rectangle("fill", endTurnBtn.x, endTurnBtn.y, endTurnBtn.w, endTurnBtn.h)
love.graphics.setColor(1, 1, 1)
love.graphics.print("Mana: " .. amana, 20, 70)
love.graphics.printf("End Turn", endTurnBtn.x, endTurnBtn.y + 15, endTurnBtn.w, "center")
resetTurnBtn = {
    x = screenWidth - 150,
    y = screenHeight - 40, -- just below endTurnBtn
    w = 120,
    h = 50
  }
  love.graphics.setColor(0.4, 0.1, 0.1)
  love.graphics.rectangle("fill", resetTurnBtn.x, resetTurnBtn.y, resetTurnBtn.w, resetTurnBtn.h)
  love.graphics.setColor(1, 1, 1)
  love.graphics.printf("Reset Turn", resetTurnBtn.x, resetTurnBtn.y + 15, resetTurnBtn.w, "center")
love.graphics.setFont(love.graphics.newFont(20))
love.graphics.print("Player Score: " .. aScore, screenWidth -200, 70)
love.graphics.print("Enemy Score: " .. eScore, screenWidth - 200, 90)
love.graphics.print("Current Power: " .. powerHelp[state], screenWidth - 200, 110)
if win == true then
  love.graphics.setColor(0, 1, 0)
  love.graphics.printf("You Win!", 0, screenHeight / 2 - 100, screenWidth, "center")
  end
if loss == true then
love.graphics.setColor(0, 1, 0)
  love.graphics.printf("You Lose!", 0, screenHeight / 2 - 100, screenWidth, "center")
end
resetBtn = {
  x = screenWidth - 150,
  y = 20,
  w = 120,
  h = 40
}
love.graphics.setColor(0.5, 0.1, 0.1)
love.graphics.rectangle("fill", resetBtn.x, resetBtn.y, resetBtn.w, resetBtn.h)
love.graphics.setColor(1, 1, 1)
love.graphics.printf("Reset", resetBtn.x, resetBtn.y + 10, resetBtn.w, "center")
end

function start()
  mana=1
  loss=false
  win=false
  amana=mana
  emana=mana
  aScore=0
  eScore=0
  state = 2
  grabbed ={}
  aDeck = {}
  eDeck = {}
  aHand = {}
  eHand = {}
  aDiscard = 0
  powerHelp = {0,0,0}
  eDiscard = 0 
  turnHelper = false
    areas = {
  AreaClass:new(r),
  AreaClass:new(g),
  AreaClass:new(b)
}
  local allNames = {
    "WoodenCow", "Pegasus", "Minotaur", "Titan", "Zeus",
    "Midas", "Aphrodite", "Hera", "Artemis", "Persephone",
    "Hephaestus", "Dionysus", "Hercules", "Hades"
  }

  -- Shuffle allNames manually
  for i = #allNames, 2, -1 do
    local j = math.random(i)
    allNames[i], allNames[j] = allNames[j], allNames[i]
  end

  -- Use first 10 shuffled names for each deck
  for i = 1, 10 do
    for j = 1, 2 do
      table.insert(aDeck, createCard(allNames[i]))
    end
  end

  -- Shuffle again for enemy deck
  for i = #allNames, 2, -1 do
    local j = math.random(i)
    allNames[i], allNames[j] = allNames[j], allNames[i]
  end

  for i = 1, 10 do
    for j = 1, 2 do
      table.insert(eDeck, createCard(allNames[i]))
    end
  end

shuffle(eDeck)
shuffle(aDeck)
aDraw()
aDraw()
aDraw()
eDraw()
eDraw()
eDraw()

end
