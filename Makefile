SHELL = /bin/bash

ifeq ($(VERCEL), 1)
  # The yarn version is picked from .engines in package.json
  YARN=yarn
  BSB=npx bsb
else
  # Yarn version specified here because it can't bootstrap itself as a devDependency with npx.
  YARN=npx yarn@1.22
  BSB=npx bsb
endif

.PHONY: dev
dev: install-deps watch

.PHONY: install-deps
install-deps:
ifeq ($(VERCEL), 1)
	npm config set user root
	yum install perl-Digest-SHA
endif
	$(YARN) install
	make vendor/ood

vendor/ood:
	cd vendor && ./update-ood.sh

.PHONY: watch
watch:
	$(YARN) watch

.PHONY: build
build:
	$(YARN) build

.PHONY: serve
serve: build
	$(YARN) start-test-server

.PHONY: clean
clean:
	-$(BSB) -clean
	-rm -rf .next
	-rm -rf out

.PHONY: distclean
distclean: clean
	-rm -rf vendor/ood
	-rm -rf node_modules
	-rm -f yarn-error.log
