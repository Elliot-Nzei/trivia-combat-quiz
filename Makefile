# Makefile for Python Quiz Game App

APP_NAME = quizgame
PYTHON = python3
VENV = .venv
ACTIVATE = $(VENV)/bin/activate
REQS = requirements.txt

# Default target
all: run

# Create virtual environment
$(VENV)/bin/activate:
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv $(VENV)

# Install dependencies
install: $(VENV)/bin/activate
	@echo "Installing dependencies..."
	. $(ACTIVATE) && pip install --upgrade pip && pip install -r $(REQS)

# Run the app
run: install
	@echo "Starting the quiz app with uvicorn..."
	. $(ACTIVATE) && uvicorn main:app --reload

# Clean environment
clean:
	@echo "Removing virtual environment..."
	rm -rf $(VENV)

# Freeze requirements
freeze:
	. $(ACTIVATE) && pip freeze > $(REQS)

# Test the app

# Git push changes
.PHONY: push
push:
	@git add .
	@git status
	@git commit -m "Update"
	@git push

# Git pull latest changes
git-pull:
	@git pull
# Help message
help:
	@echo "Makefile commands:"
	@echo "  all        - Run the app"
	@echo "  install    - Install dependencies"
	@echo "  run        - Start the quiz app"
	@echo "  clean      - Remove virtual environment"
	@echo "  freeze     - Freeze requirements to requirements.txt"
	@echo "  git-push   - Push changes to git repository"
	@echo "  git-pull   - Pull latest changes from git repository"
	@echo "  help       - Show this help message"