.PHONY: release

release:
	@echo "Creating release commit: $(tag)"
	git commit --allow-empty --message "Cutting release $(tag)"
	@echo "Tagging release commit: $(tag)"
	git tag $(tag)
	@echo "Pushing"
	git push origin main
	git push --tags