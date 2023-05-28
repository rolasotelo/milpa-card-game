.SILENT:

install_dependencies:
	echo ""
	echo "🐍・Installing python dependencies"
	echo ""
	gum spin --spinner monkey --title "Installing..." -- pip install -r requirements.txt
	echo "Done 🪇"
	echo ""