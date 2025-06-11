_G.World = {}
World.__index = World
setmetatable({}, World)
World.height = 700
World.width = 1200

function World:genNoise()
    self.noiseDen = 50
    math.randomseed(os.time())
    self.grid = {}
    for i = 0, self.width  do
        self.grid[i] = {}
        for j = 0, self.height do
            local r = math.random(1, 100)
            if r > self.noiseDen then
                self.grid[i][j] = 'floor'
            else
                self.grid[i][j] = 'wall'
            end
        end
    end
end

function World:smoothing()
    for i = 0, 15 do
        local temp = self.grid
        for j = 0, self.width  do
            for k = 0, self.height do
                local wallCnt = 0
                if ((j - 1 < 0 or k - 1 < 0) or
                    (j + 1 > self.width or k + 1 > self.height)) or
                    ((temp[j - 1][k - 1] == 'wall') or
                    (temp[j][k - 1] == 'wall') or
                    (temp[j + 1][k - 1] == 'wall') or
                    (temp[j - 1][k] == 'wall') or
                    (temp[j - 1][k + 1] == 'wall') or
                    (temp[j][k + 1] == 'wall') or
                    (temp[j + 1][k + 1] == 'wall'))then

                        wallCnt = wallCnt + 1
                end

                if wallCnt > 4 then
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
