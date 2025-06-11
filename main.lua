_G.love = require("love")
_G.Player = require(".player")
_G.World = require(".world")
function love.load()
    World:genRoom()
    Player.new()
end

function love.update(dt)
    Player:move()
end

function love.draw()
    World:show()
    Player:show()
end
