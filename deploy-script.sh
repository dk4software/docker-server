#! /bin/bash

set -o errexit

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Usage: deploy-script.sh <deploy zip name> <deploy folder>"
        exit
fi

if [ ! -f "$1".zip ]; then
        echo "$1.zip file is missing!"
        exit
fi

rm -rf "$2/$1"/src/*

unzip -o "$1".zip -d "$2/src/"


cd "$2/$1" || exit

cd src/app1 || exit

docker build --file ./Deploy/Dockerfile -t vendor/app1 .

cd ../app2 || exit

docker build -t vendor/app2 .

cd ../app3 || exit

docker build -t vendor/app3 .

cd ../app4 || exit

docker build -f Dockerfile -t vendor/app4 .

cd ../.. || exit

bin/restart
