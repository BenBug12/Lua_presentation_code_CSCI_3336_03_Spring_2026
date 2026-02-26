local a = 1
local IsaMathProblem = true
local playerName = "Adventurer"
print("Welcome, " .. playerName .. "!")
print("Let's solve a math problem together.")

if IsaMathProblem then
    print("What is 2 + 2?")
    local answer = io.read()
    
    if answer == "4" then
        print("Correct! Great job!")
    else
        print("That's not right. The correct answer is 4.")
    end
else
    print("No math problem today. Enjoy your adventure!")
end

local function ExampleFunction(savednumExample)
    print("This is an example Function!")
    local result = savednumExample * 2
    return result
end
local savednum = 5
ExampleFunction(savednum)
print("The result of the function is: " .. ExampleFunction(savednum))