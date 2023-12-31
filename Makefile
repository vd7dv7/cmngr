setup-package:
	pip install virtualenv
	pip install build

build-charmongerai-package:
	make setup-package
	cp README.md charmongerai
	cd charmongerai && python -m build

build-community-profiler-package:
	make setup-package
	cd community-profiler && python -m build

install:
	cd charmongerai && pip install -e .[dev]

setup-dev:
	cp scripts/pre-commit .git/hooks
	cp scripts/pre-push .git/hooks

lint:
	flake8 .

format:
	cd charmongerai && isort . && black .

format-staged-files:
	echo "Auto-formatting not implemented"
