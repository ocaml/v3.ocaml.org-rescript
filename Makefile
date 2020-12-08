.PHONY: ci-build
ci-build:
	nvm install
	nvm use
	npm install -g esy@1.6.7 # for eventual dune install
	npx yarn@1.22 build