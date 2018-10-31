--Copy t1 table to t2 table
local function copytable(t1,t2,lvl)
    for k,v in pairs(t1) do
        if type(v)=="table" then
            t2[k]={}
            copytable(v,t2[k],lvl+1)
        else
            t2[k]=v
        end
    end
end

function table.copy(t1)
    local t2 = {}
    copytable(t1,t2,0)
    return t2
end

--Convert a table into a pretty string
local function table2string(data,lvl)
    local r = ""

    local t = ""
    for i=1,lvl do t = t.."\t" end

    if type(data)=="table" then
        for k,v in pairs(data) do
            r = r..t..tostring(k)..":\n"..table2string(v,lvl+1)
        end
    else
        r = t..tostring(data).."\n"
    end
    return r
end

function table.toString(data)
    return table2string(data,0)
end