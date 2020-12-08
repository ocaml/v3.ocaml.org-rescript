.PHONY: ci-install-deps
ci-install-deps:
    nvm install
	nmv use
	npm install -g esy@1.6.7 # for eventually dune install
	npx yarn@1.22 install

.PHONY: ci-build
ci-build:
	nvm use
	npx yarn@1.22 build