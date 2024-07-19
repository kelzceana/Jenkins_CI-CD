# Variables
IMAGE_NAME=demo-app
IMAGE_TAG=1.0

.PHONY: stop-docker

# Bring running images down
docker-down:
	docker ps -q | xargs -r docker stop

# Build the Docker image
.PHONY: build
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

# To setup Docker in a Jenkins container environment
jenkins-up:
	docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock  -v /usr/bin/docker:/usr/bin/docker jenkins/jenkins:lts
