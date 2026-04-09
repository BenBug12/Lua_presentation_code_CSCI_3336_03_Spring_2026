local language = {"lua", "python", "javascript", "c++", "java"}

print(language[1])

table.insert(language, "ruby")

table.insert(language, 2, "c#")

table.remove(language, 4)

table.remove(language, 1)

table.sort(language)

print(table.concat(language, ", "))

print(language[1]) -- This will print the first language in the sorted list