-- The double dashes mean this is a comment. The computer ignores it!
local playerName = "Explorer"  -- Storing text (called a String)
local health = 100             -- Storing a number
local hasKey = false           -- Storing a true/false value (called a Boolean)

-- The two dots (..) paste strings and variables together
print("Welcome to the dungeon, " .. playerName)
print("Starting health: " .. health)
print("Do you have the key? " .. tostring(hasKey))

local coins = 50
local swordCost = 75

-- Checking if the player has enough money
if coins >= swordCost then
    print("You bought the sword!")
    coins = coins - swordCost
    print("Remaining coins: " .. coins)
else
    local missingCoins = swordCost - coins
    print("You cannot afford this. You need " .. missingCoins .. " more coins.")
end

print("Match starting in:")

-- This loop starts at 3, stops at 1, and goes down by -1 each time
for i = 3, 1, -1 do
    print(i .. "...")
end

print("GO!")

-- Creating the function
local function calculateDamage(attackPower, enemyArmor)
    local actualDamage = attackPower - enemyArmor
    
    -- Prevent healing the enemy if their armor is higher than the attack
    if actualDamage < 0 then
        actualDamage = 0 
    end
    
    return actualDamage
end

-- Using the function later in the script
local hit1 = calculateDamage(25, 10)
print("First strike dealt: " .. hit1 .. " damage.")

local hit2 = calculateDamage(15, 20)
print("Second strike dealt: " .. hit2 .. " damage.")