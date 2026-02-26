function love.load()
    circleX = 400
    circleY = 300
    speed = 200
    radius = 10
end
function love.update(dt)
    if love.keyboard.isDown("d") then
        circleX = circleX + (speed * dt)
    end
    if love.keyboard.isDown("a") then
        circleX = circleX - (speed * dt)
    end
    if love.keyboard.isDown("w") then
        circleY = circleY - (speed * dt)
    end
    if love.keyboard.isDown("s") then
        circleY = circleY + (speed * dt)
    end
end
function love.draw()
    love.graphics.setColor(1, 0, 1)
    love.graphics.circle("fill", circleX, circleY, radius)
    love.graphics.print("hello", 200, 200)
end