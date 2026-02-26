-- 1. Variables: Setting up the initial state
local playerCurrency = 500
local ugcItemCost = 150
local ownsItem = false

-- Greet the player
print("Welcome to the Avatar Shop!")
print("Your current balance is: " .. playerCurrency)
print("Would you like to buy the new accessory for " .. ugcItemCost .. "? (type 'yes' or 'no')")

-- 2. User Input: Waiting for the player to answer
local playerChoice = io.read()

-- 3. Conditionals: Deciding what to do based on the answer
if playerChoice == "yes" then
    
    -- Checking if they can actually afford it
    if playerCurrency >= ugcItemCost then
        playerCurrency = playerCurrency - ugcItemCost
        ownsItem = true
        print("Purchase successful! Your new balance is: " .. playerCurrency)
    else
        print("Oops, you don't have enough currency for this.")
    end

elseif playerChoice == "no" then
    print("No problem! Saving up is always a good idea.")
else
    print("Error: Command not recognized. Please run the script again.")
end

-- 4. Loops: A small countdown if the purchase went through
if ownsItem == true then
    print("\nAdding item to your inventory...")
    
    -- A simple for-loop to simulate a loading sequence
    for i = 3, 1, -1 do
        print("Equipping in " .. i .. "...")
    end
    
    print("Item equipped and ready to use!")
end