_G.Generic = {}
Generic.__index = Generic
setmetatable({}, Generic)

local moves = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}}

function Generic:new(name, health, equip)
    self.name = name
    self.health = health
    self.equip = equip
    return self
end

function Generic:setInitPos(x, y)
    self.x = x
    self.y = y
end

function Generic:move(target)
    local dist = math.sqrt(((self.x - target.x) ^ 2) + ((self.y - target.y) ^ 2))
    local chosenMove = nil

    for move in moves do
        local dist2 = math.sqrt(((self.x + move[1] - target.x) ^ 2) + ((self.y + move[2] - target.y) ^ 2))
        if dist2 < dist then
            chosenMove = move
        end
    end

    self.x = self.x + chosenMove[1]
    self.x = self.x + chosenMove[2]
end

function Generic:show()
    love.graphics.setColor(0, 100, 100)
    love.graphics.rectangle("fill", (self.x * 50), (self.y * 50), 50, 50)
end

function Generic:attack(target)

end

return Generic
