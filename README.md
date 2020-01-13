
Enigmatica:2 Expert
===================

https://www.curseforge.com/minecraft/modpacks/enigmatica2expert

Run the docker image by executing this command:

```
docker run -i -p 25565:25565 --name e2e antomatic10/enigmatic2expert
```

I use a script like this:

```
#!/bin/bash

docker stop e2e
docker rm e2e
docker pull antomatic10/enigmatic2expert

docker run -d --name e2e \
           -v /home/johndoe/e2e/world:/minecraft/world \
           --restart always \
           -p 25565:25565 \
           antomatic10/enigmatic2expert
```
