SHELL=/bin/bash
ifeq ($(CI), 1)
	YARN=yarn
	ESY=npx esy
	BSB=npx bsb
else
	# Yarn version specified here because it can't
	# bootstrap itself as a devDependency.
	NVM=source $$NVM_DIR/nvm.sh && nvm
	YARN=$(NVM) use && npx yarn@1.22
	ESY=$(NVM) use && npx esy
	BSB=$(NVM) use && npx bsb
endif

.PHONY: dev
dev: install-deps watch-and-serve

.PHONY: install-deps
install-deps:
ifeq ($(CI), 1)
	npm config set user root
	yum install perl-Digest-SHA
else
	$(NVM) install
endif
	$(YARN) install
	make vendor/ood && $(YARN) link ood
	$(ESY)

vendor/ood:
	mkdir -p vendor && cd vendor && \
	git clone https://github.com/ocaml/ood.git && cd ood && \
	$(YARN) link

.PHONY: watch
watch:
	$(YARN) watch

.PHONY: watch-and-serve
watch-and-serve:
	$(YARN) watch-and-serve

.PHONY: build
build:
	$(YARN) build

.PHONY: serve
serve: build
	$(YARN) start-test-server

.PHONY: clean
clean:
	-$(BSB) -clean
	-$(ESY) dune clean
	-rm -f .merlin
	-rm -rf .next
	-rm -rf out

.PHONY: distclean
distclean: clean
	-($(YARN) unlink ood && cd vendor/ood && $(YARN) unlink)
	-rm -rf vendor
	-rm -rf node_modules
	-rm -rf _esy
	-rm -f yarn-error.log
