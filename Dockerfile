FROM openjdk:alpine
MAINTAINER Anthony Martel <antomatic10@gmail.com>

USER root
WORKDIR /minecraft

VOLUME ["/minecraft/world"]
EXPOSE 25565

# Download and unzip minecraft files
RUN apk update && apk add curl wget && \
    mkdir -p /minecraft/world && \
    curl -L -o Enigmatica2ExpertServer.zip https://github.com/NillerMedDild/Enigmatica2Expert/archive/1.75.zip && \
    unzip Enigmatica2ExpertServer.zip && \
    mv Enigmatica2Expert-1.75/* ./ && \
    rm Enigmatica2ExpertServer.zip && \
    rm -r Enigmatica2Expert-1.75
    
# Accept EULA
RUN echo "# EULA accepted on $(date)" > /minecraft/eula.txt && \
    echo "eula=TRUE" >> eula.txt
    
# Install minecraft server itself
RUN /bin/sh /minecraft/setup.sh

# Startup script
CMD ["/bin/sh", "/minecraft/ServerStartLinux.sh"] 
