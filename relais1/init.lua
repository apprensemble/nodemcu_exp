print("\n")
print("ESP8266 Started")

local luaFile = {"relai.lua"}
for i, f in ipairs(luaFile) do
    if file.open(f) then
      file.close()
      print("Compile File:"..f)
      node.compile(f)
   print("Remove File:"..f)
       file.remove(f)
     end
  end
 
 luaFile = nil
 collectgarbage()
 
 dofile("relai.lc");
