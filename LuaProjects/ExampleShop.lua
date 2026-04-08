-- INTERACTIVE MARKETPLACE MENU

-- Our shop's inventory (A table of tables)
local inventory = {
    {id = 1, name = "Brass Goggles", price = 25},
    {id = 2, name = "Pressure Valve", price = 10},
    {id = 3, name = "Aether Engine Core", price = 250},
    {id = 4, name = "Clockwork Gear", price = 5}
}

-- The player's shopping cart (An empty table to start)
local cart = {}
local isShopping = true

print("========================================")
print("  Welcome to the Airship Supply Depot!  ")
print("========================================")

while isShopping do
    print("\n--- MAIN MENU ---")
    print("1. Shop for items")
    print("2. View your cart")
    print("3. Checkout")
    print("4. Leave store")
    io.write("Select an option (1-4): ")

    -- Get user input from the terminal
    local choice = io.read()

    -- OPTION 1: SHOPPING
    if choice == "1" then
        print("\n--- INVENTORY ---")
        for i, item in ipairs(inventory) do
            print(item.id .. ". " .. item.name .. " - $" .. item.price)
        end
        
        io.write("Enter the ID of the item to buy (or 'b' to go back): ")
        local itemChoice = io.read()
        
        -- Convert their input to a number to check the inventory
        local itemId = tonumber(itemChoice)
        if itemId and inventory[itemId] then
            local selectedItem = inventory[itemId]
            table.insert(cart, selectedItem) -- Add it to the cart table
            print("\n>> Added " .. selectedItem.name .. " to your cart! <<")
        elseif itemChoice ~= "b" then
            print("\n>> Invalid item ID. <<")
        end

        -- OPTION 2: VIEW CART
    elseif choice == "2" then
        print("\n--- YOUR CART ---")
        if #cart == 0 then
            print("Your cart is currently empty.")
        else
            local currentTotal = 0
            for i, item in ipairs(cart) do
                print("- " .. item.name .. " ($" .. item.price .. ")")
                currentTotal = currentTotal + item.price
            end
            print("Current Total: $" .. currentTotal)
        end

        -- OPTION 3: CHECKOUT
    elseif choice == "3" then
        if #cart == 0 then
            print("\n>> You have nothing in your cart to checkout! <<")
        else
            local finalTotal = 0
            for i, item in ipairs(cart) do
                finalTotal = finalTotal + item.price
            end
            print("\n--- CHECKOUT ---")
            print("Your grand total is: $" .. finalTotal)
            print("Thank you for your purchase! Preparing items for transport...")
            
            -- Empty the cart after checkout
            cart = {} 
        end
        -- OPTION 4: EXIT
    elseif choice == "4" then
        print("\nThank you for visiting! Safe travels in the skies.")
        isShopping = false -- This breaks the while loop and ends the program

    -- INVALID INPUT
    else
        print("\n>> Invalid choice. Please type 1, 2, 3, or 4. <<")
    end
end