
build:
	docker build --rm -t ohtomi/snippet-systemd-service .

run:
	docker run --rm -v $PWD:/etc/systemd/system/ ohtomi/snippet-systemd-service

.PHONY: build run
