-- This is a single line comment
print("Hello World!")

--[[
    This is a multi-line comment
]]

-- Concate strings
print("Hello " .. "My name is " .. "Arthur")

--[[
    nil
    number 1 1.24 0.1 44
    string 'Hello' "Hello World"
    boolean true false
    table {}
]]

-- Variables
lastName = "ZHANG"
local firstName = "Yu"
print("Hello " .. firstName .. " " .. lastName)

-- Multiline string
local description = [[
    Colo
Hello World
please]]

print(description)

-- Get type
print(type(firstName))

-- Math
local str = "66"
print(tonumber(str) + 1)
print(5 % 2)
print(2 ^ 3)
print(2 * 3)
print(10 / 3)
print(math.pi)
print(math.random(1, 100))
print(os.time())
print(math.floor(math.pi))
print(math.ceil(math.pi))
print(math.sin(20))
print(math.cos(20))
print(math.tan(20))

-- Strings
print("Hello\nWorld\t!!!!!\vI'm Arthur")
print(string.upper("Hello World"))
print(string.lower("Hello World"))
print(string.len("Hello World"))
print(string.reverse("Hello World"))
print(string.sub("Hello World", 1, 5))
print(string.char(97))
print(string.byte("a"))
print(string.format("Hello %s", "Arthur"))
print(string.find("Hello World", "World"))
print(string.gsub("Hello World", "World", "Arthur"))

-- If statement
local age = 7
if age >= 17 then
    print("Adult")
elseif (age > 5) and (age < 10) then
    print("Child")
else
    print("Teen")
end

-- For loop statement
for i = 1, 2, 1 do
    print(i)
end

-- While loop statement
while true do
    print("Hello World")
    break
end

-- Repeat loop statement
local i = 0
repeat
    print("Hello World")
    i = i + 1
until i > 2

-- User scripts
local num1, num2 = 10, 5
local true_ans = 15
io.write("Input " .. num1 .. " + " .. num2 .. ": ")
local ans = io.read()

print("You Answer: " .. ans)

if tonumber(ans) == true_ans then
    print("Correct")
else
    print("Wrong")
end

-- Tables
local arr = {10, true, "hello", 2.4}
for i = 1, #arr do
    print(arr[i])
end

table.insert(arr, 3, "insert")
table.remove(arr, 3)

-- Multi-dimensional table
local arr2 = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
}

print(arr2[1][1])

for i = 1, #arr2 do
    for j = 1, #arr2[i] do
        print(arr2[i][j])
    end
end

-- Functions
function add(num1, num2)
    -- Global scope variable
    _G.Gans = 10
    local ans = num1 + num2
    return ans, ans + Gans
end

ans, other = add(10, 5)
ans2, _ = add(10, 5)
print(ans .. " " .. other)
print(ans2)

local function sum(...)
    print(...)
    local sum = 0
    for key, value in pairs({...}) do
        sum = sum + value
    end
    return sum
end

print(sum(1, 2, 3, 4, 5))

-- Co-Routines
routine_1 = coroutine.create(
    function()
        for i = 1, 10, 1 do
            print("Routine_1: " .. i)
            if i == 5 then
                coroutine.yield()
            end
        end
    end
)

local routine_func = function ()
    for i = 11, 20 do
        print("Routine_2: " .. i)
    end
end

local routine_2 = coroutine.create(routine_func)

coroutine.resume(routine_1)
coroutine.resume(routine_2)
coroutine.resume(routine_1)

if coroutine.status(routine_1) == "suspended" then
    coroutine.resume(routine_1)
end

print(coroutine.status(routine_1))

-- Working with files (Simple version)
-- Create file

-- io.output("test.txt")
-- io.write("Hello World")
-- io.close()

-- Read file
io.input("test.txt")

--  Read 5 characters
local file1 = io.read(5)
-- Read number
local file2 = io.read("*number")
-- Read line
local file3 = io.read("*line")
-- Read all
local file4 = io.read("*all")

-- Working with files (Complex version)
--  r | w | a | r+ | w+ | a+
local file = io.open("myFile.txt", "r")
file:write("Hello World")
local content = file:read("*all")
file:close()

print(content)

-- Os module
-- Time
print(os.date())
print(os.time())
print(os.time({
    year = 2020,
    month = 1,
    day = 1,
    hour = 0,
    min = 0,
    sec = 0
}))

print(os.difftime(os.time(), os.time({
    year = 2020,
    month = 1,
    day = 1,
    hour = 0,
    min = 0,
    sec = 0
})))

-- Os Environment Variables
print(os.getenv("HOME"))

-- File
os.rename("myFile.txt", "myFile2.txt")
os.remove("myFile2.txt")

-- Commands
os.execute("ls -la")

-- Timer
local start = os.clock()
for i = 1, 10 do
    print(i)
end
print(os.clock() - start)

-- exit
for i = 1, 10 do
    print(i)
    if i == 5 then
        os.exit()
    end
end

-- Custome Modules
local mod = require("mmath")
print(mod.add(10, 5))

-- OOP
local t = {
    firstName = "",
    lastName = "",
    age = 0
}

print(Person.firstName)

local function Pet(name)
    name = name or "Not Named"
    return {
        name = name
        status = "Hungry"

        feed = function(self)
            self.status = "Full"
        end
    }
end

local function Dog(name, breed)
    local dog = Pet(name)
    dog.breed = breed
    dog.loyalty = 0

    dog.isLoyal = function(self)
        return self.loyalty >= 10
    end

    dog.feed = function(self)
        print("Dog is being fed...")
        self.status = "Full"
        self.loyalty = self.loyalty + 5
        print("Dog's loyalty: " .. self.loyalty)
    end

    dog.bark = function(self)
        print("Woof!")
    end

    return dog
end

local cat = Pet("Cat")
print(cat.status)
cat:feed()
print(cat.status)

local dog = Dog("Dog", "Pug")
print(dog.name)
print(dog.status)
print(dog.breed)
dog:feed()
dog:feed()
print(dog:isLoyal())

dog:bark()

-- MetaMethods
local function addTableValues(x, y)
    return x.num + y.num
end

--[[
    __add = +
    __sub = -
    __mul = *
    __div = /
    __mod = %
    __pow = ^
    __concat = ..
    __len = #
    __eq = ==
    __lt = <
    __le = <=
    __gt = >
    __ge = >=
]]

local metatable = {
    __add = addTableValues
    __sub = function(x, y)
        return x.num - y.num
    end
}

local tbl1 = {
    num = 10
}

local tbl2 = {
    num = 5
}

setmetatable(tbl1, metatable)

local ans = tbl1 + tbl2
local ans2 = tbl1 - tbl2