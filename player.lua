_G.Character = {
    x = 575,
    y = 300,
    size = 50,
    show = function (self)
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", self.x, self.y, 50, 50)
    end,
    move = function (self)
            if love.keyboard.isDown("right") then
                self.x = self.x + 5
            elseif love.keyboard.isDown("left") then
                self.x = self.x - 5
            elseif love.keyboard.isDown("down") then
                self.y = self.y + 5
            elseif love.keyboard.isDown("up") then
                self.y = self.y - 5
            end
    end
}
return Character
