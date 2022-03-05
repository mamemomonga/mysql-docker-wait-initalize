IMAGE_NAME=build-mysql-docker-wait-initalize

dist:
	docker build -t $(IMAGE_NAME) .
	docker run --rm $(IMAGE_NAME) tar cC /g dist | tar xv
	docker rmi $(IMAGE_NAME)

clean:
	rm -rf dist

.PHONY: clean
