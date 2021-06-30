-------------[[ LUA PRACTICE ]]------------

-- Messing around with global variable
messageCalls = 0;

--[[
  Prints out a message
  Takes in a string name, string message, and numbered amount of times
  you want this message to print to console
]]
function message(name, message, i)
  for count = 0, i do
    print(name .. ", " .. message)
  end

  messageCalls = messageCalls + 1
  printLogs()

  return i * 10
end

--[[
  Prints out how many times Message function has been called
]]
function printLogs()
  if messageCalls == 1 then
    print(string.format("\nMessage fuction has been called: %d time\n", messageCalls))
  elseif messageCalls > 1 then
    print(string.format("\nMessage function has been called: %d times\n", messageCalls))
  end
end

--[[
  Creates an array with each index multiplied by some multiplier
  Takes in a number size of the array and a number multiplier
  to multiply each element by
]]
function createMultipliedArray(size, multiplier)
  local array = {}

  for i = 1, size do
    array[i] = i * multiplier
  end

  return array
end

--[[
  Since Lua has no way to get the size of an array as a table,
  this function will get the array size.
  Takes in a table called array
]]
function getArraySize(array)
  local count = 0

  for _, i in pairs(array) do
    count = count + 1
  end

  return count
end

--[[
  Reverses the values of an inputted array
  Takes in an array represented as a table and the size of the array
  Size can also be an index to reverse the array up to
]]
function reverseArray(array, size)
  local newArray = {}
  local start = 1
  local last = size

  while(start < last) do
    newArray[start] = array[last]
    newArray[last] = array[start]
    start = start + 1
    last = last - 1
  end

  return newArray
end

--[[
  Prints out an inputted array
  Takes in an array represented as a table
]]
function printArray(array)
  for _, value in pairs(array) do
    print(value)
  end

  print("\n")
end

-- Main function, driver code. Don't forget to call it at the end!
function Main()
  local edgar = {
    ["name"] = "edgar",
    ["message"] = "do not forget to do your taxes"
  }

  local result = message(edgar["name"], edgar["message"], 5)
  print(string.format("%s's love points: %d\n" , edgar["name"], result))

  local array = createMultipliedArray(7, 3)
  printArray(array)

  local size = getArraySize(array)
  local reversedArray = reverseArray(array, size)
  printArray(reversedArray)
end

Main()
-- End :P
