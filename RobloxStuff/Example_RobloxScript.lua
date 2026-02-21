print("Hello world!")

-- variables
local part = Instance.new("Part")

-- properties
part.Color = Color3.new(0, 0, 1)
part.Position = Vector3.new(0, 10, 0)
--part.Parent = workspace

local ball = Instance.new("Part")
ball.Shape = Enum.PartType.Ball
ball.Position = Vector3.new(0, 10, 0)
ball.Color = Color3.new(0.682353, 1, 0)
--ball.Parent = workspace

for i = 1, 5 do
	print(i)
	local clonePart = part:Clone()
	local cloneBall = ball:Clone()
	clonePart.Parent = workspace
	cloneBall.Parent = workspace
end

local a = 10
local b = 20
local c = a + b
print("math was done:" .. c)