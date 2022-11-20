#!/bin/bash

dockerruntimename=jackietest01
dockerbuildname=local/pytest:v1
dockervolumemountpath=$PWD/dockerpytest
gitcloneurl="https://github.com/jpoon2088/dockerpytest.git"
branchname="main"

docker stop $dockerruntimename && docker rm $dockerruntimename

if [ -d "$dockervolumemountpath" ]; then
  echo "$dockervolumepath exists, checkout main branch..."
  cd $dockervolumemountpath && git checkout $branchname && git pull
  cd ..
  echo "done! - 1"
else
  echo "$dockervolumemountpath does not exists, git cloning..."
  git clone $gitcloneurl
  cd $dockervolumemountpath && git checkout $branchname
  cd ..
  echo "done! - 2"
fi

docker build -t local/pytest:v1 .
docker run -d --name $dockerruntimename -v /var/run/docker.sock:/var/run/docker.sock -v $dockervolumemountpath:/stuff $dockerbuildname
docker exec -it $dockerruntimename bash
