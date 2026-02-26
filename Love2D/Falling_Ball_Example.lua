local world
local bird
local ground

function love.load()
    world = love.physics.newWorld(0, 9.81 * 64, true)
    
    bird = {}
    bird.body = love.physics.newBody(world, 400, 100, "dynamic")
    bird.shape = love.physics.newCircleShape(20)
    bird.fixture = love.physics.newFixture(bird.body, bird.shape)
    bird.fixture:setRestitution(0.6)

    ground = {}
    ground.body = love.physics.newBody(world, 400, 500, "static")
    ground.shape = love.physics.newRectangleShape(800, 50)
    ground.fixture = love.physics.newFixture(ground.body, ground.shape)
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    love.graphics.setColor(0.2, 0.8, 0.2)
    love.graphics.polygon("fill", ground.body:getWorldPoints(ground.shape:getPoints()))

    love.graphics.setColor(0.8, 0.2, 0.2)
    love.graphics.circle("fill", bird.body:getX(), bird.body:getY(), bird.shape:getRadius())
end