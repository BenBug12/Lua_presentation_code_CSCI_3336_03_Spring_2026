-- ==========================================
-- 1. DYNAMIC TYPING DEMONSTRATION
-- ==========================================
print("--- Demonstrating Dynamic Typing ---")

-- We declare a variable, but we don't say what type it is.
local myVar = 42 
print("Value is: " .. tostring(myVar) .. " | Type is: " .. type(myVar))

-- In a statically typed language (like C++ or Java), the next line would cause an error.
-- In Lua, the variable simply adapts to the new value's type.
myVar = "Hello Class!" 
print("Value is: " .. myVar .. " | Type is: " .. type(myVar))

myVar = true
print("Value is: " .. tostring(myVar) .. " | Type is: " .. type(myVar))


print("\n") -- Just adding some space in the terminal output


-- ==========================================
-- 2. STATIC (LEXICAL) SCOPING DEMONSTRATION
-- ==========================================
print("--- Demonstrating Static (Lexical) Scoping ---")

-- We define a variable in the 'outer' scope
local secretWord = "Outer Scope Word"

-- We define a function. Because Lua is lexically scoped, this function 
-- is permanently bound to the 'secretWord' that exists right here where it is written.
local function revealSecret()
    print("revealSecret() sees: " .. secretWord)
end

-- Now we create a new function that creates its OWN local variable 
-- with the exact same name, and then calls the first function.
local function testScoping()
    local secretWord = "Inner Scope Word"
    print("Inside testScoping(), the local variable is: " .. secretWord)
    
    -- THE CRITICAL TEST:
    -- If Lua used Dynamic Scoping, revealSecret() would look at who called it, 
    -- see the new inner 'secretWord', and print "Inner Scope Word".
    -- Because Lua uses Static Scoping, revealSecret() ignores who called it and 
    -- only cares about where it was written. It will print "Outer Scope Word".
    revealSecret()
end

-- Run the test
testScoping()