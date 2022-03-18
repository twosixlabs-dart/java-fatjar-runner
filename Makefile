IMAGE_PREFIX = twosixlabsdart
IMAGE_NAME = java-fatjar-runner
IMG := $(IMAGE_PREFIX)/$(IMAGE_NAME)
VERSION = latest

docker-login:
	docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}

docker-build:
	docker build --pull -t $(IMG):$(VERSION) .

docker-push: docker-login docker-build
	docker push $(IMG):$(VERSION)
