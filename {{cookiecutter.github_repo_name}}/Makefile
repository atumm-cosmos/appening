# use the rest as arguments for targets
TARGET_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(TARGET_ARGS):;@:)

-include .env

run:
	pdm config python.use_venv true && \
	pdm install && pdm run -v appi

install:
	pdm install

compile: install
	pdm run pyinstaller --collect-all appi -n {{cookiecutter.project_slug}} --onefile {{cookiecutter.project_slug}}/main.py

run-bin: compile
	./dist/{{cookiecutter.project_slug}}

system: compile
	cp ./dist/{{cookiecutter.project_slug}} ~/.local/bin/{{cookiecutter.project_slug}}
	mkdir -p ~/.local/share/{{cookiecutter.project_slug}}
	cp {{cookiecutter.project_slug}}.png ~/.local/share/{{cookiecutter.project_slug}}/{{cookiecutter.project_slug}}.png
	sed -i "s|HOME_PATH|${HOME}|g" {{cookiecutter.project_slug}}.desktop
	cp {{cookiecutter.project_slug}}.desktop ~/.local/share/applications/


shell:
	eval $(pdm venv activate)

flatrun:
	flatpak-builder --force-clean --disable-cache build-dir {{cookiecutter.app_id}}.yml
	flatpak-builder --user --install --force-clean build-dir {{cookiecutter.app_id}}.yml
	flatpak run {{cookiecutter.app_id}}
