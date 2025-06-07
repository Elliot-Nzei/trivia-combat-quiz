# Makefile for Python Quiz Game App (Windows compatible)

APP_NAME = quizgame
PYTHON = python
VENV = .venv
ACTIVATE = $(VENV)\Scripts\activate
REQS = requirements.txt

# Default target
all: run

# Create virtual environment
$(VENV)\Scripts\activate:
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv $(VENV)

# Install dependencies
install: $(VENV)\Scripts\activate
	@echo "Installing dependencies..."
	$(VENV)\Scripts\python.exe -m pip install --upgrade pip
	$(VENV)\Scripts\python.exe -m pip install -r $(REQS)

# Run the app
run: install
	@echo "Starting the quiz app with uvicorn..."
	$(VENV)\Scripts\python.exe -m uvicorn main:app --reload

# Clean environment
clean:
	@echo "Removing virtual environment..."
	rmdir /S /Q $(VENV)

# Freeze requirements
freeze:
	$(VENV)\Scripts\python.exe -m pip freeze > $(REQS)

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