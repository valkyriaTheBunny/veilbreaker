_G.Character = require(".character")

_G.Player = {}
Player.__index = Player
setmetatable(Player, Character)
Player.x = 0
Player.y = 0

function Player.new()
    local instance = setmetatable({}, Player)
    return instance
end

function Player:show()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", self.x, self.y, 50, 50)
end

function Player:move()
    if love.keyboard.isDown("right") and self.x < 1200 then
        self.x = self.x + 5
    elseif love.keyboard.isDown("left") and self.x > 0 then
        self.x = self.x - 5
    elseif love.keyboard.isDown("down") and self.y < 700 then
        self.y = self.y + 5
    elseif love.keyboard.isDown("up") and self.y > 0 then
        self.y = self.y - 5
    end
end

return Player
