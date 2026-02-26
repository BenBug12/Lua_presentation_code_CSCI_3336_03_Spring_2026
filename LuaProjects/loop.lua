local currentStamina = 10
local maxStamina = 50

print("Player is resting. Starting stamina: " .. currentStamina)

-- The loop checks this condition before every single run.
-- It asks: "Is currentStamina strictly less than maxStamina?"
while currentStamina < maxStamina do
    
    -- THIS IS THE SAFETY VALVE: 
    -- We are increasing the stamina by 10 every time. 
    -- This guarantees the condition will eventually become false.
    currentStamina = currentStamina + 10
    
    print("Regenerating... Stamina is now at " .. currentStamina)
    
end

-- Once currentStamina hits 50, the loop breaks and the code continues here.
print("Stamina is fully restored! You are ready to sprint.")