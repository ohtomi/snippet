
build:
	docker build --rm -t ohtomi/snippet-systemd-service .

run:
	docker run --rm -it --name snippet --privileged \
		ohtomi/snippet-systemd-service

.PHONY: build run
