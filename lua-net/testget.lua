
local https = require 'ssl.https'
local resp = {}

local r, c, h, s = https.request{
    url = "https://api.site.com/1/card/VzV5JC/desc",
    sink = ltn12.sink.table(resp),
    protocol = "tlsv1"
}


print ("\n r -- " .. type(r))
print(r)

print ("\n c -- " .. type(c))
print (c)

print ("\n h -- " .. type(h))
print (h)
print (table.getn(h))
    for i,line in ipairs(h) do
      print(i .. " -- " .. line)
    end

print ("\n s -- " .. type(s))
print (s)

print ("\n resp -- " .. type(resp))
print (table.getn(resp))
    for i,line in ipairs(resp) do
      print(i .. " -- " .. line)
    end

