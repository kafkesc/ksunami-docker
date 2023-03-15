.PHONY: push-git-release-tag publish-docker-image

push-git-release-tag:
	@echo "Creating release commit: $(tag)"
	git commit --allow-empty --message "Cutting release $(tag)"
	@echo "Tagging release commit: $(tag)"
	git tag -f $(tag)
	@echo "Pushing"
	git push origin main
	git push --tags

publish-docker-image:
	docker buildx build \
		--build-arg KSUNAMI_VERSION=$(tag) \
		--platform=linux/amd64,linux/arm64 \
		--tag=kafkesc/ksunami:latest \
		--tag=kafkesc/ksunami:$(tag) \
	    --push .
