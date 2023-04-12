# Appening - Your favorite DIY desktop app creator!

[![image](https://github.com/giswqs/pypackage/workflows/build/badge.svg)](https://github.com/giswqs/pypackage/actions?query=workflow%3Abuild)
[![image](https://github.com/giswqs/pypackage/workflows/docs/badge.svg)](https://giswqs.github.io/pypackage)

In a nutshell this creates the source code for a python app that can be installed on any linux flavor

Supported platforms:
[x] Linux

## Requirements

1. python3.9
2. make
3. PDM

## Features

- PDM managed
- Uses PySide6 for rendering
- Persistent cookiejar
- Support for app icon
- Installable .desktop file

Only **linux** is supported

## Quickstart

### Dependencies

#### 1. Install make

```bash
sudo apt-get install make
```

#### 2. Install Python dependencies

- pdm
- cookiecutter

Install dependencies via make

```bash
make install-deps
```

#### 3. download the app icon

```bash
curl -o /tmp/app.png https://example.com/image.png
```

#### 4. Create the app

cookiecutter gh:atumm-ra/appening

You'll be asked to fill in the parameters, most defaults would do, but you need to fill in the following (&examples):

I'm using formaviva as an example, this app is an independent creation that has nothing to do with formaviva

```bash
webapp_url: https://formaviva.com
app_name: Formaviva Desktop
```

Optional but recommended

```bash
icon_path: /tmp/app.png
```

Now after following the interactive console, you'll end up with a project that uses PySide6 to embed the web application
you want


#### 5. Install the app

```bash
cd formaviva-desktop
make system
```

What happens here is that it initializes a virtual environment, installs the dependencies (PySide and pyinstaller)
compile a binary of the application, and assembles the .desktop file and copies it to the ~/.local/bin and ~
/.local/share/applications/app.desktop



### To Do

Feel free to open a PR with any of the following, if there isn't one already.

- [ ] Support flatpak
- [ ] host a flatpak repository for all apps created with appening
- [ ] Support Mac OS X


Cheers!

