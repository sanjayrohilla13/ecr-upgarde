testqube_VERSION ?= 9.0
#ECR_REPO = 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/testqube
ECR_REPO = $(AWS_ACC_NO).dkr.ecr.ap-southeast-2.amazonaws.com/testqube
FULL_VERSION = $(testqube_VERSION)-$(BUILD_NUMBER)
ECR_FULL_IMAGE = $(ECR_REPO):$(FULL_VERSION)

.EXPORT_ALL_VARIABLES:
docker-build:
	docker build -t centos-repo .
.PHONY: docker-build

# Login to AWS registry (must have docker running)
login-ecr:
	aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin $(ECR_REPO) 
.PHONY: login-ecr

push-ecr:
#echo $(ecr-name)
#docker push $(ECR_FULL_IMAGE)
	ECR_REPO=$(AWS_ACC_NO).dkr.ecr.ap-southeast-2.amazonaws.com/testqube
	@echo $(ECR_FULL_IMAGE)
.PHONY: push-ecr