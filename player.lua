_G.Player = {
    x = 575,
    y = 300,
    size = 50,
    draw = function (self)
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", self.x, self.y, 50, 50)
    end
}
