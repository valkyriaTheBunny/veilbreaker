_G.World = {}
World.__index = World
setmetatable({}, World)

function World:genNoise()
    self.noiseDen = 50
    math.randomseed(os.time())
    self.grid = {}
    for i = 0, 1200  do
        self.grid[i] = {}
        for j = 0, 700 do
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
    
end

function World:genRoom()

end
