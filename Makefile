SHELL=/bin/bash
NVM=source $$NVM_DIR/nvm.sh && nvm
YARN=$(NVM) use && npx yarn@1.22
ESY=$(NVM) use && npx esy@0.6.10

# NOTE: currently, yarn@VERSION is used throughout because
# the first invocation of npx yarn installs yarn itself.
# since we can't control which order users run the commands
# below, we guard all usages of yarn with a version.

.PHONY: install-deps
install-deps:
	$(NVM) install
	# TODO: ensure esy has already been installed
	# trigger installation of yarn, if missing
	$(YARN) --version
	$(YARN) install
	$(ESY)

.PHONY: ci-install-deps
ci-install-deps:
	# installing esy encounters permission errors
	# npm install -g esy@0.6.8
	npx yarn@1.22 --version
	npx yarn@1.22 install
	# npx esy@0.6.8

.PHONY: watch
watch:
	$(YARN) watch

.PHONY: build
build:
	$(YARN) build

.PHONY: ci-build
ci-build:
	npx yarn@1.22 build

.PHONY: serve
serve:
	$(YARN) start-test-server

.PHONY: clean
clean:
	$(NVM) use && npx bsb -clean
