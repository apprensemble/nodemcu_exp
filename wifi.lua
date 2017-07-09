print(wifi.sta.getip())
--nil
wifi.setmode(wifi.STATION)
wifi.sta.config("Livebox-CFFC","CF5341C5D91651E54127C6E947")
print(wifi.sta.getip())
--192.168.18.110
