_G.Player = {}
Player.__index = Player
setmetatable({}, Player)

function Player.new()
    local instance = setmetatable({}, Player)
    return instance
end

function Player:setPosition(x, y)
    self.x = x
    self.y = y
end

function Player:getPosition()
    return {self.x, self.y}
end

function Player:show()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", self.x, self.y, 50, 50)
end

return Player
