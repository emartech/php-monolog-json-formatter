DOCKER = docker
CONTAINER = php-monolog-json-formatter

ifndef TESTMETHOD
FILTERARGS=
else
FILTERARGS=--filter $(TESTMETHOD)
endif

.PHONY: all test destroy

all: destroy build run

destroy:
	-$(DOCKER) rm -f $(CONTAINER)

build:
	$(DOCKER) build --no-cache -t $(CONTAINER) .

run:
	$(DOCKER) run -d -v "$$PWD":/$(CONTAINER)/ --rm --name=$(CONTAINER) -h $(CONTAINER).ett.local $(CONTAINER)

stop:
	$(DOCKER) stop $(CONTAINER)

restart: stop run

ssh: sh
sh:
	$(DOCKER) exec -i -t $(CONTAINER) /bin/bash

test: phpunit

phpunit:
	$(DOCKER) exec $(CONTAINER) bash -c "cd /$(CONTAINER) && vendor/bin/phpunit -c test/phpunit.xml $(FILTERARGS) $(TESTFILE)"
