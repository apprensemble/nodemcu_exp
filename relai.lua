print("Ready to start soft ap AND station")
local str=wifi.ap.getmac();
local ssidTemp=string.format("%s%s%s",string.sub(str,10,11),string.sub(str,13,14),string.sub(str,16,17));
wifi.setmode(wifi.STATIONAP)

local cfg={}
cfg.ssid="relais_"..ssidTemp;
cfg.pwd="12345678"
wifi.ap.config(cfg)
 cfg={}
 cfg.ip="192.168.3.1";
 cfg.netmask="255.255.255.0";
 cfg.gateway="192.168.3.1";
 wifi.ap.setip(cfg);
 
 --wifi.sta.config("Livebox-CFFC","CF5341C5D91651E54127C6E947")
 wifi.sta.config("ESP8266_b2e22f","12345678")
 wifi.sta.connect()
 
 local cnt = 0
 gpio.mode(0,gpio.OUTPUT);
 tmr.alarm(0, 1000, 1, function() 
     if (wifi.sta.getip() == nil) and (cnt < 20) then 
         print("Trying Connect to Router, Waiting...")
         cnt = cnt + 1 
              if cnt%2==1 then gpio.write(0,gpio.LOW);
              else gpio.write(0,gpio.HIGH); end
     else 
         tmr.stop(0);
         print("Soft AP started")
         print("Heep:(bytes)"..node.heap());
         print("MAC:"..wifi.ap.getmac().."\r\nIP:"..wifi.ap.getip());
         if (cnt < 20) then print("Conected to Router\r\nMAC:"..wifi.sta.getmac().."\r\nIP:"..wifi.sta.getip())
             else print("Conected to Router Timeout")
         end
 gpio.write(0,gpio.LOW);
         cnt = nil;cfg=nil;str=nil;ssidTemp=nil;
         collectgarbage()
     end 
 end)

