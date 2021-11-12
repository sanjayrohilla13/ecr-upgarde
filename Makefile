# Login to AWS registry (must have docker running)

# Build docker target
docker-build:
	docker build -f Dockerfile --no-cache -t mycompany/myapp .

# Login to AWS registry (must have docker running)
docker-login:
	//$$(aws ecr get-login --no-include-email --region ap-southeast-2 --profile=mycompany)
	$$(aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com)

# Tag docker image
docker-tag:
	$(eval REV=$(shell git rev-parse HEAD | cut -c1-7))
	docker tag mycompany/myapp:latest 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/mycompany/myapp:latest
	docker tag mycompany/myapp:latest 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/mycompany/myapp:$(REV)

# Push to registry
docker-push:
	$(eval REV=$(shell git rev-parse HEAD | cut -c1-7))
	docker push 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/mycompany/myapp:latest
	docker push 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/mycompany/myapp:$(REV)

#Push the Image into ECR 
push-ecr:
	docker tag centos-repo:latest 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/centos-repo:latest
	docker push 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/centos-repo:latest
.phony: push-ecr

# Build docker image and push to AWS registry
docker-build-and-push: docker-login docker-build docker-tag docker-push 
