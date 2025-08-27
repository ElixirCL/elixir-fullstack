.PHONY: install build server
BUILD=docker
CONTAINER_LABEL=local/antora:elixir-fullstack

install i:
	${BUILD} build -t ${CONTAINER_LABEL} .

build b:
	@rm -rf docs/
	${BUILD} run -u $(id -u):$(id -g) -v .:/antora:z --rm -t ${CONTAINER_LABEL} antora-playbook.yml
	@touch docs/.nojekyll

server s:
	@cd docs && python3 -m http.server
	