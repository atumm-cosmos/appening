BAKE_OPTIONS=--no-input

help:
	@echo "bake 	generate project using defaults"
	@echo "watch 	generate project using defaults and watch for changes"
	@echo "replay 	replay last cookiecutter run and watch for changes"

setup:
	sudo apt-get install -y build-essential libc6 libc6-dev

bake:
	cookiecutter $(BAKE_OPTIONS) . --overwrite-if-exists

watch: bake
	watchmedo shell-command -p '*.*' -c 'make bake -e BAKE_OPTIONS=$(BAKE_OPTIONS)' -W -R -D \{{cookiecutter.project_slug}}/

replay: BAKE_OPTIONS=--replay
replay: watch
	;

install-deps:
	pip install -U pdm cookiecutter

run: bake
	cd appi && \
	pdm config python.use_venv true && \
	pdm install -G dev && make run-bin

zorbaELyonany5454%$