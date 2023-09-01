BIN_DIR := bin

include hack/tools.mk

.PHONY: build
build:
	@./hack/build.sh

.PHONY: clean
clean:
	@rm -rf $(BIN_DIR)/

.PHONY: revendor
revendor:
	@env GO111MODULE=on go mod tidy
	@env GO111MODULE=on go mod vendor

.PHONY: check
check: $(GOLANGCI_LINT)
	@./hack/check.sh --golangci-lint-config=./.golangci.yaml ./internal/...

.PHONY: add-license-headers
add-license-headers: $(GO_ADD_LICENSE)
	@./hack/add_license_headers.sh
