.SILENT:

start_stop_dev: check_venv_env_exit_if_not
	echo ""
	echo "🚧・Nothing to do here yet"
	echo ""

initialize: install_dependencies set_up_pre_commit

install_dependencies:
	echo ""
	echo "🐍・Installing python dependencies"
	echo ""
	gum spin --spinner monkey --title "Installing..." -- ./venv/bin/pip3 install -r requirements-dev.txt
	echo "Done 🪇"
	echo ""

set_up_pre_commit: set_up_git_hooks run_pre_commit

set_up_git_hooks:
	echo ""
	echo "🚓・Setting up pre-commit"
	echo ""
	gum spin --spinner monkey --title "Setting up..." -- pre-commit install
	gum spin --spinner monkey --title "Setting up..." -- pre-commit install --hook-type commit-msg
	echo "Done 🪇"
	echo ""

run_pre_commit:
	echo ""
	echo "🚓・Running pre-commit in all files"
	echo ""
	pre-commit run --all-files
	echo "Done 🪇"
	echo ""

check_venv_env_exit_if_not:
	echo ""
	echo "🐍・Checking if venv is activated"
	echo ""
	if [ -z $$VIRTUAL_ENV ]; then \
		echo "Not activated ❌"; \
		echo ""; \
		echo "Please activate it with: source venv/bin/activate"; \
		echo ""; \
		exit 1; \
	else \
		echo "Virtual environment is activated 🪇"; \
	fi
	echo ""
