# Protoc Image


The repoisiotry will build images reequired for building client and service.

* protocbuffer/Dockerfile: 
  Create protocbuffer image for compile client pb files.

* golang/Dockerfile:
  Create golang image for build release image of service.

* debugger/Dockerfile:
  Create debugger image

* kolla-ansible:
  Create kolla-in-docker image
  
  ```shell
  # run kolla ansible container
  docker-compose -f ./kolla-ansible/docker-compose.yaml up -d

  # copy customized executable script
  cp kolla-ansible/ka-c /usr/local/bin/ka-c
  chmod +x /usr/local/bin/ka-c
  ```






