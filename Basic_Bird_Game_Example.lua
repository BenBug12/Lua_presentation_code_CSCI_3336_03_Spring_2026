-- main.lua

local world, ground, bird
local crates = {}

-- Slingshot variables
local anchorX, anchorY = 200, 400
local isDragging = false
local maxDrag = 100

-- UI Button definition (X, Y, Width, Height)
--local btnReset = { x = 20, y = 20, w = 110, h = 40 }

-- Helper Function to Spawn/Respawn the Bird, the Angry Bird himself
local function spawnBird()
    -- If a bird already exists, destroy its physics body first!
    if bird and bird.body and not bird.body:isDestroyed() then
        bird.body:destroy()
    end
    
    bird = {}
    bird.body = love.physics.newBody(world, anchorX, anchorY, "kinematic")
    bird.shape = love.physics.newCircleShape(15)
    bird.fixture = love.physics.newFixture(bird.body, bird.shape)
    bird.fixture:setRestitution(0.4)
    isDragging = false
end

-- Helper Function to Spawn/Respawn the Crates, you know to spawn the crates itself.
local function spawnCrates()
    -- Destroy all existing crates first to prevent memory leaks
    for _, crate in ipairs(crates) do
        if crate.body and not crate.body:isDestroyed() then
            crate.body:destroy()
        end
    end
    crates = {} -- Clear the Lua table
    
    -- Randomize how many columns of crates we want (between 1 and 4 columns)
    local numColumns = math.random(1, 4) 
    local startX = 500 -- The X coordinate where the first column starts
    
    -- Loop 1: Move horizontally to create columns
    for col = 1, numColumns do
        -- Randomize how tall THIS specific column will be (between 2 and 6 crates)
        local stackHeight = math.random(2, 6) 
        local currentX = startX + (col * 45) -- Space columns 45 pixels apart
        
        -- Loop 2: Move vertically to stack crates in the current column
        for row = 1, stackHeight do
            local crate = {}
            local currentY = 500 - (row * 40) -- Stack them upward
            
            crate.body = love.physics.newBody(world, currentX, currentY, "dynamic")
            crate.shape = love.physics.newRectangleShape(40, 40)
            crate.fixture = love.physics.newFixture(crate.body, crate.shape, 1) 
            table.insert(crates, crate)
        end
    end
end

function love.load()
    -- Seed the random number generator using the system clock
    math.randomseed(os.time())

    -- World physics
    world = love.physics.newWorld(0, 9.81 * 64, true)

    -- Ground
    ground = {}
    ground.body = love.physics.newBody(world, 400, 550, "static")
    ground.shape = love.physics.newRectangleShape(800, 50)
    ground.fixture = love.physics.newFixture(ground.body, ground.shape)

    -- Call our new functions to build the level
    spawnCrates()
    spawnBird()
end

function love.update(dt)
    world:update(dt)

    -- Dragging Logic
    if isDragging then
        local mx, my = love.mouse.getPosition()
        local dx, dy = mx - anchorX, my - anchorY
        local dist = math.sqrt(dx^2 + dy^2)
        
        if dist > maxDrag then
            local angle = math.atan2(dy, dx)
            mx = anchorX + math.cos(angle) * maxDrag
            my = anchorY + math.sin(angle) * maxDrag
        end
        bird.body:setPosition(mx, my)
    end

    -- If the launched bird flies way off the screen, spawn a new one
    if bird.body:getType() == "dynamic" then
        local bx, by = bird.body:getPosition()
        if bx > 1000 or bx < -100 or by > 800 then
            spawnBird()
        end
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        -- Check if the user clicked inside the Reset Button bounds
        --if x >= btnReset.x and x <= btnReset.x + btnReset.w and 
        --   y >= btnReset.y and y <= btnReset.y + btnReset.h then
        --    spawnCrates()
        --    spawnBird()
        --    return -- Stop running the rest of the mouse checks
        --end

        -- Otherwise, check if clicking the bird
        if bird.body:getType() == "kinematic" then
            local bx, by = bird.body:getPosition()
            local dist = math.sqrt((x - bx)^2 + (y - by)^2)
            if dist < 30 then
                isDragging = true
            end
        end
    end
end

function love.mousereleased(x, y, button)
    if button == 1 and isDragging then
        isDragging = false
        bird.body:setType("dynamic")
        
        local bx, by = bird.body:getPosition()
        local impulseX = (anchorX - bx) * 12
        local impulseY = (anchorY - by) * 12
        bird.body:applyLinearImpulse(impulseX, impulseY)
    end
end

function love.keypressed(key)
    -- Allow the player to manually load a new bird by pressing the Spacebar
    if key == "space" then
        spawnBird()
    end
end

function love.draw()
    -- Draw Ground
    love.graphics.setColor(0.2, 0.8, 0.2)
    love.graphics.polygon("fill", ground.body:getWorldPoints(ground.shape:getPoints()))

    -- Draw Crates
    for _, crate in ipairs(crates) do
        love.graphics.setColor(0.8, 0.6, 0.2)
        love.graphics.polygon("fill", crate.body:getWorldPoints(crate.shape:getPoints()))
        love.graphics.setColor(0, 0, 0)
        love.graphics.polygon("line", crate.body:getWorldPoints(crate.shape:getPoints()))
    end

    -- Draw Slingshot Band
    if bird.body:getType() == "kinematic" then
        love.graphics.setColor(1, 1, 1)
        love.graphics.line(anchorX, anchorY, bird.body:getX(), bird.body:getY())
    end

    -- Draw Bird
    love.graphics.setColor(0.8, 0.2, 0.2)
    love.graphics.circle("fill", bird.body:getX(), bird.body:getY(), bird.shape:getRadius())

    -- Draw Reset Button (Blue box with white text)
    --love.graphics.setColor(0.2, 0.4, 0.8)
    --love.graphics.rectangle("fill", btnReset.x, btnReset.y, btnReset.w, btnReset.h)
   -- love.graphics.setColor(1, 1, 1)
   -- love.graphics.print("RESET GAME", btnReset.x + 10, btnReset.y + 12)

    -- Draw Instructions
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Press SPACE to load a new bird", 250, 20)
end