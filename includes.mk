check-registry:
	@if [ -z "$$DEIS_REGISTRY" ] && [ -z "$$DEV_REGISTRY" ]; then \
	  echo "DEIS_REGISTRY is not exported"; \
	exit 2; \
	fi
