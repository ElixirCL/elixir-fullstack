.PHONY: install build server shell
BUILD=docker
CONTAINER_LABEL=local/antora:elixir-fullstack

install i:
	${BUILD} build -t ${CONTAINER_LABEL} .

build b:
	@rm -rf docs/
	${BUILD} run -u $(id -u):$(id -g) -v .:/antora:z --rm -t ${CONTAINER_LABEL} antora-playbook.yml
	@touch docs/.nojekyll

shell sh:
	${BUILD} run -it --entrypoint /bin/sh -v .:/antora:z -t ${CONTAINER_LABEL}

server s:
	@cd docs && python3 -m http.server
	