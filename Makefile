POETRY_BIN ?= poetry
PYTHON_BIN ?= $(POETRY_BIN) run python

format: isort black

install:
	poetry install --no-root

isort: install
	$(PYTHON_BIN) -m isort -rc src

black: install
	$(PYTHON_BIN) -m black --target-version py36 --exclude '/(\.git|\.hg|\.mypy_cache|\.nox|\.tox|\.venv|_build|buck-out|build|dist|node_modules|webpack_bundles)/' src
