all: build

build: src
	emacs --batch --eval "(byte-recompile-directory \"src/app/\" 0 t)"
	charm build -o $(shell pwd)/dist/ src/

deploy: dist
	juju deploy --repository="dist/" local:trusty/elnode

upgrade: dist
	juju upgrade-charm --repository="dist/" elnode

install:
	rm -rf $(LAYER_PATH)/elnode
	cp -r dist/trusty/elnode $(LAYER_PATH)
