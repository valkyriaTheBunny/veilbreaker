_G.love = require("love")
_G.World = require(".world")
_G.Player = require(".player")
local dtotal = 0

function love.load()
    Player.new()
    World:genRoom()
    local pos = World:findFirstFloor()
    Player:setPosition(pos[1], pos[2])
end

function love.update(dt)
    local playerPos = Player:getPosition()
    local wasPressed = false
    dtotal = dtotal + dt

    if dtotal >= 0.5 then
        dtotal = dtotal - 0.5
        if love.keyboard.isDown("right") and playerPos[1] + 1 < 24 then
            playerPos[1] = playerPos[1] + 1
            wasPressed = true
        elseif love.keyboard.isDown("left") and playerPos[1] - 1 > 0 then
            playerPos[1] = playerPos[1] - 1
            wasPressed = true
        elseif love.keyboard.isDown("down") and playerPos[2] + 1 < 14 then
            playerPos[2] = playerPos[2] + 1
            wasPressed = true
        elseif love.keyboard.isDown("up") and playerPos[2] - 1 > 0 then
            playerPos[2] = playerPos[2] - 1
            wasPressed = true
        end
    end

    if wasPressed and World:validSpot(playerPos[1], playerPos[2]) then
        Player:setPosition(playerPos[1], playerPos[2])
        World:update(Player)
    end
end

function love.draw()
    World:show()
    Player:show()
end
