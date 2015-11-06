all: build

build: src
	+$(make) charm build -l DEBUG -o dist src/

deploy: dist
	juju deploy --repository="dist/" local:trusty/elnode

upgrade: dist
	juju upgrade-charm --force --repository="dist/" elnode
