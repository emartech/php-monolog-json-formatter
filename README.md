Copyright EMARSYS 2016 All rights reserved.


Setting up a development environment with Docker
================================================

Use Docker(https://www.docker.com/products/docker#/mac) to set up a dev env in a virtual machine.

For first time build the docker image

    make
    
Start docker container

    make run

Open shell in docker container

    make sh

Install dependencies

    make run
    make sh
    cd /php-monolog-json-formatter && composer install

Running tests

    make test
