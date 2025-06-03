_G.love = require("love")
_G.Player = require(".player")
function love.load()

end
function love.update(dt)
    Player:move()
end
function love.draw()
    Player:show()
end
