# Home Server Containers
In the docker-compose files found in this directory are some of the containers I use in my personal home lab. I created templates of each individual container, so you can just add it to your own docker-compose file. Dont forget to change path directories, usernames, passwords, ports and timezones according to your needs, since they are all the defaults or placeholders.

## Run the docker-compose file
```
sudo docker-compose up -d
```

# Information

## 1. CUPS
This is a printing server, made to put printers that ran out of driver support and still run on USB connection to be turned into network printers.

## 2. Nextcloud
Cloud storage server with tons of extra features. A great alternative if you don't want to spend money on Google Drive. It is best to back-up to an off-site storage place if you decide to use this as your main storage server.

## 3. Nginx proxy manager
Proxy manager that works with letsencrypt for easy and free SSL certificates. Ideal for in a home lab in combination with DuckDNS.

## 4. Portainer
General dashboard to keep track of all of your docker containers in an environment. Also possible to add Kubernetes and other docker standalone or swarm environments.
