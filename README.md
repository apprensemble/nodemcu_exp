# NodeMCU Lua

Projet d'utilisation du nodeMCU. A terme je souhaite que ce soit le point d'entré de tout mes projets NodeMCU.

## But du projet

Reunir le monde electronique et informatique via ce qu'on appel vulgairement : les objets connectés et le big data.

## Où en est le projet?

Pour le moment j'ai reçu 3 NodeMCU sur lesquels j'ai mis le firmware. 2 capteurs de presence infrarouge et j'avais déjà un arduino UNO avec quelques babioles. :)
J'ai testé le matériel, il est fonctionnel et prêt à l'emploi, ya plus qu'à...

## Cheatsheet

### Pour demarer

aller sur https://nodemcu.readthedocs.io/ et suivre les instructions. En gros il faut compiler un firmware depuis sa machine ou en ligne, installer les outils de communication avec le nodemcu, uploader le firmware puis uploader un fichier init.lua qui indiquera le comportement que doit avoir le nodemcu au demarage. Ce fichier n'est pas obligatoire.

### action esptool

````sh
esptool.py --port /dev/ttyUSB0 write_flash -fm dio 0x0 firmware/nodemcu-firmware/bin/nodemcu_integer_1.5.4.1-final_20170708-1522.bin
````

  esptool.py --port le_port action -fm le_mode l_adresse le_firmware

### source

https://github.com/espressif/esptool

### action nodemcu-tool

lancer le terminal : ```lua nodemcu-tool terminal```

voir les fichiers sur le node : ```lua nodemcu-tool fsinfo```

effacer un fichier : ```lua nodemcu-tool remove nom_fichier```

envoyer un fichier : ```lua nodemcu-tool upload nom_fichier```

lancer un programme : ```lua nodemcu-tool run nom_fichier```

activer un port gpio : gpio.write(index,gpio.{HIGH|LOW}) ce qui donne en vrai ```lua gpio.write(2,gpio.HIGH)```

### source

https://github.com/AndiDittrich/NodeMCU-Tool

### action en lua que l'on peut aussi lancer via le terminal

Arret wifi : ```lua wifi.setmode(wifi.NULLMODE)```

## ressources indispensables

https://nodemcu.readthedocs.io/

### schema 

https://github.com/nodemcu/nodemcu-devkit-v1.0

### Fritzing

https://github.com/squix78/esp8266-fritzing-parts/tree/master/nodemcu-v1.0

https://github.com/adafruit/Fritzing-Library/blob/master/parts/PIR%20sensor.fzpz
