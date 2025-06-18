_G.Generic = require('.genericMon')
_G.Generator = {}
Generator.__index = Generator
setmetatable({}, Generator)

local Goblin = Generic:new('Goblin', 10, 'Sword')
local Troll = Generic:new('Troll', 20, 'Club')
local choices = {Goblin, Troll}

function Generator.create(x)
    math.randomseed(os.time() + (os.time() * os.time()))
    local mon = choices[x or math.random(2)]
    return mon
end

function Generator:test()
    local tCreature = self.create(1)
    return tCreature == Goblin
end

function Generator.GenTest()
    return Generic:test1()
end

return Generator
