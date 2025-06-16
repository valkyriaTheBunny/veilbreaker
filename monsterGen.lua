_G.Generic = require('.genericMon')
_G.Generator = {}
Generator.__index = Generator
setmetatable({}, Generator)

local Goblin = Generic:new('Goblin', 10, 'Sword')
local Troll = Generic:new('Troll', 20, 'Club')
local choices = {Goblin, Troll}

function Generator.create()
    math.randomseed(os.time() + (os.time() * os.time()))
    local mon = choices[math.random(2)]
    return mon
end

return Generator
