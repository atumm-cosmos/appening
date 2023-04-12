import sys
from PySide6.QtWidgets import (QApplication)

from {{cookiecutter.project_slug}}.{{cookiecutter.project_slug}} import MainWindow

app = QApplication(sys.argv)

main_window = MainWindow('{{ cookiecutter.webapp_url }}')
available_geometry = main_window.screen().availableGeometry()
main_window.resize(available_geometry.width(), available_geometry.height())
main_window.show()
sys.exit(app.exec())
