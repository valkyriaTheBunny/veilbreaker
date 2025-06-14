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
    local modified = {math.floor(playerPos[1]/50), math.floor(playerPos[2]/50)}

    if love.keyboard.isDown("right") then
        modified[1] = modified[1] + 1
    elseif love.keyboard.isDown("left") then
        modified[1] = modified[1] - 1
    elseif love.keyboard.isDown("down") then
        modified[2] = modified[2] + 1
    elseif love.keyboard.isDown("up") then
        modified[2] = modified[2] - 1
    end

    if World:validSpot(modified[1], modified[2]) then
        Player:move()
    end
end

function love.draw()
    World:show()
    Player:show()
end
