_G.Generator = require('.monsterGen')
_G.World = {}
World.__index = World
setmetatable({}, World)
World.height = 14
World.width = 24
World.monsterList = {}

function World:genNoise()
    local noiseDen = 35
    math.randomseed(os.time() + (os.time() * os.time()))
    self.grid = {}
    for i = 0, self.width do
        self.grid[i] = {}
        for j = 0, self.height do
            local r = math.random(0, 100)
            if r > noiseDen then
                self.grid[i][j] = 'floor'
            else
                self.grid[i][j] = 'wall'
            end
        end
    end
end

function World:smoothing()
    for i = 0, 75 do
        local temp = self.grid
        for j = 0, self.width do
            for k = 0, self.height do
                local wallCnt = 0
                for x = (j - 1), (j + 1) do
                    for y = (k - 1), (k + 1) do
                        if x > 0 and y > 0
                            and x < self.width
                            and y < self.height then

                            if x ~= j and y ~= k then
                                if temp[x][y] == 'wall' then
                                    wallCnt =  wallCnt + 1
                                end
                            end
                        else
                            wallCnt =  wallCnt + 1
                        end
                    end
                end

                local r = math.random(2, 3)
                if wallCnt > r then
                    self.grid[j][k] = 'wall'
                else
                    self.grid[j][k] = 'floor'
                end
            end
        end
    end
end

function World:genRoom()
    self:genNoise()
    self:smoothing()
end

function World:show()
    for i = 0, self.width do
        for j = 0, self.height do
            if self.grid[i][j] == 'wall' then
                love.graphics.setColor(love.math.colorFromBytes(100, 0, 100))
                love.graphics.rectangle("fill", i * 50, j * 50, 50, 50)
            else
                love.graphics.setColor(love.math.colorFromBytes(255, 215, 0))
                love.graphics.rectangle("fill", i * 50, j * 50, 50, 50)

                if math.random(0, 100) < 45 then
                    local mon = Generator:create()
                    table.insert(self.monsterList, mon)
                end
            end
        end
    end

    for mon in self.monsterList do
        mon:show()
    end
end

function World:findFirstFloor()
    for i = 0, self.width do
        for j = 0, self.height do
            if self.grid[i][j] == 'floor' then
                return {i, j}
            end
        end
    end
end

function World:validSpot(x, y)
    return self.grid[x][y] == 'floor'
end

function World:update()
    for mon in self.monsterList do
        mon:move()
    end
end

return World
