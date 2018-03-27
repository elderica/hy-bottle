.PHONY: all
all:
	@echo "First you need run 'pip install pip-tools && make deps' to install dependencies."
	@echo "Run 'make prepare' to create a database."
	@echo "To run as debug mode, run 'make dev'."
	@echo "To run as production mode, run 'make prod'."

.PHONY: dev
dev:
	bottle.py --bind=0.0.0.0:8080 --server=wsgiref --debug --reload adapter:app

.PHONY: prod
prod:
	bottle.py --bind=0.0.0.0:8080 --server=waitress adapter:app

.PHONY: deps
deps:
	pip-compile
	pip-sync

todo.db: todo.sql
	sqlite3 todo.db < todo.sql

.PHONY: prepare
prepare: todo.db

.PHONY: clean
clean:
	find . | grep __pycache__ | xargs rm -rf
