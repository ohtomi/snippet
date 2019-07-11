
build:
	docker build --rm -t ohtomi/snippet-systemd-timer .

run:
	docker run --rm -it --name snippet --privileged \
		ohtomi/snippet-systemd-timer

.PHONY: build run
