_G.love = require("love")
_G.World = require(".world")
_G.Player = require(".player")

function love.load()
    Player.new()
    World:genRoom()
    local pos = World:findFirstFloor()
    Player:setPosition(pos[1], pos[2])
end

function love.update(dt)
    local playerPos = Player:getPosition()
    local wasPressed = false

    if love.keyboard.isDown("right") and playerPos[1] + 3 < 1200 then
        playerPos[1] = math.floor((playerPos[1] + 3)/50)
        playerPos[2] = math.floor((playerPos[2])/50)
        wasPressed = true
    elseif love.keyboard.isDown("left") and playerPos[1] - 3 > 0 then
        playerPos[1] = math.floor((playerPos[1] - 3)/50)
        playerPos[2] = math.floor((playerPos[2])/50)
        wasPressed = true
    elseif love.keyboard.isDown("down") and playerPos[2] + 3 < 700 then
        playerPos[1] = math.floor((playerPos[1])/50)
        playerPos[2] = math.floor((playerPos[2] + 3)/50)
        wasPressed = true
    elseif love.keyboard.isDown("up") and playerPos[2] - 3 > 0 then
        playerPos[1] = math.floor((playerPos[1])/50)
        playerPos[2] = math.floor((playerPos[2] - 3)/50)
        wasPressed = true
    end

    if wasPressed and World:validSpot(playerPos[1], playerPos[2]) then
        Player:setPosition(playerPos[1] * 50, playerPos[2] * 50)
    end
end

function love.draw()
    World:show()
    Player:show()
end
