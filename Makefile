testqube_VERSION ?= 9.0
ECR_REPO = 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/testqube

#Full version
FULL_VERSION = $(testqube_VERSION)-$(BUILD_NUMBER)

ECR_FULL_IMAGE = $(ECR_REPO):$(FULL_VERSION)
# Login to AWS registry (must have docker running)

# Build docker target
docker-build:
# docker build -f Dockerfile --no-cache -t mycompany/myapp .
	docker build -t centos-repo .
# Login to AWS registry (must have docker running)
login-ecr:
#aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com
	$(aws ecr get-login --region "ap-southeast-2 --no-include-email")
.PHONY: login-ecr

# Tag docker image
docker-tag:
# $(eval REV=$(shell git rev-parse HEAD | cut -c1-7))
	docker tag mycompany/myapp:latest 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/mycompany/myapp:latest
	docker tag mycompany/myapp:latest 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/mycompany/myapp:$(REV)

# Push to registry
docker-push:
	$(eval REV=$(shell git rev-parse HEAD | cut -c1-7))
	docker push 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/mycompany/myapp:latest
	docker push 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/mycompany/myapp:$(REV)

#Push the Image into ECR 
push-ecr:
# docker tag centos-repo:latest 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/centos-repo:Image1
	docker tag centos-repo:latest $(ECR_FULL_IMAGE)
# docker push 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/centos-repo:Image1
    $(aws ecr get-login --region "ap-southeast-2 --no-include-email")
	docker push $(ECR_FULL_IMAGE)
.PHONY: push-ecr

# Build docker image and push to AWS registry
docker-build-and-push: docker-login docker-build docker-tag docker-push 
