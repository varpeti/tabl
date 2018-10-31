require("tabl")

local t = {"asd",{{},{1,2,3}},"-",nil,1.2,alma=4,function() print(1) end,[455]="asd"}

print( table.toString(t) )

local t2 = table.copy(t)

assert(t~=t2,"t==t2")

t[1]="qwe"
assert(t[1]~=t2[1],"'qwe' == 'asd'")

t[2][1]={"let"}
assert(t[2][1][1]~=t2[2][1][1],"'let' == nil")

print("Succes!")