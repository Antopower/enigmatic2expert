FROM openjdk:alpine
MAINTAINER Anthony Martel <antomatic10@gmail.com>

USER root
WORKDIR /minecraft

VOLUME ["/minecraft/world"]
EXPOSE 25565

# Download and unzip minecraft files
RUN apk update && apk add curl wget && \
    mkdir -p /minecraft/world && \
    curl -o Enigmatica2ExpertServer.zip -L https://www.curseforge.com/minecraft/modpacks/enigmatica2expert/download/2854638/file && \
    unzip Enigmatica2ExpertServer.zip && \
    rm Enigmatica2ExpertServer.zip
    
# Accept EULA
RUN echo "# EULA accepted on $(date)" > /minecraft/eula.txt && \
    echo "eula=TRUE" >> eula.txt

# Startup script
CMD ["/bin/sh", "/minecraft/ServerStartLinux.sh"] 
