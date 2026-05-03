.PHONY: build docker-build docker-run pt1 pt2

build:
	pebble build

pt1: build
	pebble install --emulator basalt --logs

pt2: build
	pebble install --emulator emery --logs

docker-build:
	docker build --platform linux/amd64 -t pebble-builder .

docker-run: docker-build
	mkdir -p build resources
	docker run --rm --platform linux/amd64 \
		-v "$(PWD)/src:/app/src:ro" \
		-v "$(PWD)/resources:/app/resources:ro" \
		-v "$(PWD)/package.json:/app/package.json:ro" \
		-v "$(PWD)/wscript:/app/wscript:ro" \
		-v "$(PWD)/build:/app/build" \
		pebble-builder
