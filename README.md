The idea is to make a very simple Node based container mirroring gunbots official blog post on running on a vps with pm2. The docker container is somewhat pointless with the way I setup persistent volumes, except this makes a nice docker compose to passthrough to traefik for full cloudflare tls.  
  
Build docker, I call the image gunbot-node for the compose.  
```
docker build -t gunbot-node .
```
Setup cloudflare with email & API key in the compose for traefik, giving proxied full strict tls.  
Download latest from github, unzip to default directory. Persistent volumes are going to use the default directory unzip, not inside the container.  
```
wget https://github.com/GuntharDeNiro/BTCT/releases/download/hny/gunthy_linux.zip
unzip gunthy_linux.zip
```
Run docker compose  
```
docker compose up -d
```
To update to beta, stop docker compose, overwrite bot executable in main directory, restart docker compose.  
```
docker compose stop
```
Download beta from tg and stick into a beta folder, unzip and overwrite default directory executable.
```
cd beta
unzip gunthy-linux.zip
cp gunthy-linux ~/gunthy_linux
cd ~
cd docker-compose
docker compose up -d
```
Can remove traefik service from docker-compose.yml, and just go to localhost:5000 or dockercontainerip:5000.  

All your file changes can be done in ~/gunthy_linux
