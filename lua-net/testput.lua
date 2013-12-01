
local https = require 'ssl.https'
local resp = {}

local mykey = "e2428ae247"
local mytok = "d42dbd462da30516624facaaf56105d"
local mytxt = io.read("*all")

print(mytxt)

    function unescape (s)
      s = string.gsub(s, "+", " ")
      s = string.gsub(s, "%%(%x%x)", function (h)
            return string.char(tonumber(h, 16))
          end)
      return s
    end
    function escape (s)
      s = string.gsub(s, "([&=+%c])", function (c)
            return string.format("%%%02X", string.byte(c))
          end)
      s = string.gsub(s, " ", "+")
      return s
    end

print(escape(mytxt))

local r, c, h, s = https.request{
    url = "https://api.site.com/1/card/GxKRFy/desc" ..
          "?key=" .. mykey .. "&token=" .. mytok .. "&value=" .. 
          escape(mytxt) ,
    method = "PUT", 
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

