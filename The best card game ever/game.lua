function aPlay(card)

  if card.cost> amana then
   -- print("too expensive")
    return
  end
  if #areas[state].aPlay>=4 then
    print("too many")
    return
    end
  card.face=false
  card.side=1
  card.table=state
  amana=amana-card.cost
  -- Remove from aHand
  for i, c in ipairs(aHand) do
    if c == card then
      table.remove(aHand, i)
      break
    end
  end
  -- Add to the current area's player field
  table.insert(areas[state].aPlay, card)
  -- Reposition the card (example position)
  findPosition()
end
function ePlay(card)
  if card.cost ==nil then
    return
    end
  if card.cost > emana then
    --print("too expensive")
    return
  end
  local randState = math.random(1, 3)
  if #areas[randState].ePlay>=4 then
    print("too many")
    return
  end
  card.table=randState
  card.face=false
  card.side=2
  emana = emana - card.cost
  -- Remove from eHand
  for i, c in ipairs(eHand) do
    if c == card then
      table.remove(eHand, i)
      break
    end
  end
  -- Play to a random area
  
  table.insert(areas[randState].ePlay, card)
  -- Reposition
  findPosition()
end
function moveCards()
  -- If card is grabbed than move with mouse cursor
  for i = 1, #grabbed do
    local card = grabbed[i]
    card.position = Vector(love.mouse.getX() - 25, love.mouse.getY() - 25)
  end
end
function eDraw()
  table.insert(eHand,eDeck[1])
  table.remove(eDeck,1)
end
function aDraw()
  table.insert(aHand,aDeck[1])
  table.remove(aDeck,1)
  drawFindPos()
end
function shuffle(tbl)
  -- randomize cards
  for i = #tbl, 2, -1 do
    local j = math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
end

function newTurn()
  chatGPT()
  reveal()
  turnHelper=true
 end
 function finishTurn()
  powerCalcAll()
  checkWin()
  aDraw()
  eDraw()
  mana=mana+1
  amana=mana
  emana=mana
end
function aDiscard(dcard,cstate)
  for i,card in ipairs(areas[cstate].aPlay) do
  if dcard==card then
    table.remove(areas[cstate].aPlay,i)
    aDiscard=aDiscard+1
    return
    end
  end
end
function eDiscard(dcard,cstate)
  for i,card in ipairs(areas[cstate].ePlay) do
  if dcard==card then
    table.remove(areas[cstate].ePlay,i)
    eDiscard=eDiscard+1
    return
    end
  end
  end
function aDiscardHand(dcard)
  for i,card in ipairs(aHand) do
  if dcard==card then
    table.remove(aHand,i)
    aDiscard=aDiscard+1
    return
    end
  end
end
function eDiscardHand(dcard)
  for i,card in ipairs(eHand) do
  if dcard==card then
    table.remove(eHand,i)
    eDiscard=eDiscard+1
    return
    end
  end
end
function revealC(card)
   state=card.table
   card.face = true
   if card.rev then
  card.rev(card.side,card.table,card)
end
  findPosition()

end

function reveal() 
  toReveal = {}

  if aScore > eScore then
    for _, area in ipairs(areas) do
      for _, card in ipairs(area.aPlay) do
        if not card.face then
          table.insert(toReveal, card)
        end
      end
      for _, card in ipairs(area.ePlay) do
        if not card.face then
          table.insert(toReveal, card)
        end
      end
    end

  elseif eScore > aScore then
    for _, area in ipairs(areas) do
      for _, card in ipairs(area.ePlay) do
        if not card.face then
          table.insert(toReveal, card)
        end
      end
      for _, card in ipairs(area.aPlay) do
        if not card.face then
          table.insert(toReveal, card)
        end
      end
    end

  else -- tie
    local coin = flipCoin()
    if coin == 1 then
      for _, area in ipairs(areas) do
        for _, card in ipairs(area.aPlay) do
          if not card.face then
            table.insert(toReveal, card)
          end
        end
        for _, card in ipairs(area.ePlay) do
          if not card.face then
            table.insert(toReveal, card)
          end
        end
      end
    else -- coin == 2
      for _, area in ipairs(areas) do
        for _, card in ipairs(area.ePlay) do
          if not card.face then
            table.insert(toReveal, card)
          end
        end
        for _, card in ipairs(area.aPlay) do
          if not card.face then
            table.insert(toReveal, card)
          end
        end
      end
    end
  end
end



function powerCalcAll()
  for i = 1, 3 do
    local total = 0

    for j, card in ipairs(areas[i].aPlay) do
      total = total + card.power
    end
    for j, card in ipairs(areas[i].ePlay) do
      total = total - card.power
    end

    if total == 0 then
      -- skip, nothing changes
    elseif total >= 1 then
      aScore = aScore + total
    else -- total <= -1
      eScore = eScore + (-1 * total)
    end
  end
end

function flipCoin()
  if math.random() < 0.5 then
    return 1
  else
    return 2
  end
end
function checkWin()
  if eScore>=20 and aScore>=20 then
    if eScore<aScore then
      win=true
      return
    end
    loss=true
  end
  if eScore>19 then
    loss=true
  end
  if aScore>=20 then
    win=true
    end
  end
  
