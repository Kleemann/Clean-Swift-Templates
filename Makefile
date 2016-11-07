XCODE_USER_TEMPLATES_DIR=~/Library/Developer/Xcode/Templates/File\ Templates
XCODE_USER_SNIPPETS_DIR=~/Library/Developer/Xcode/UserData/CodeSnippets
SNIPPETS_PREFIX=Clean\ Swift
TEMPLATES_DIR=Clean\ Swift
SNIPPETS_DIR=Snippets

install:install_templates install_snippets
	@echo "Install Done"


install_snippets:
	@mkdir -p $(XCODE_USER_SNIPPETS_DIR)
	@rm -fR $(XCODE_USER_SNIPPETS_DIR)/$(SNIPPETS_PREFIX)
	@cp $(SNIPPETS_DIR)/* $(XCODE_USER_SNIPPETS_DIR)
	@echo "Restart Xcode to see changes!"

install_templates:
	mkdir -p $(XCODE_USER_TEMPLATES_DIR)
	rm -fR $(XCODE_USER_TEMPLATES_DIR)/$(TEMPLATES_DIR)
	cp -R $(TEMPLATES_DIR) $(XCODE_USER_TEMPLATES_DIR)


uninstall: uninstall_templates uninstall_snippets
	@echo "Uninstall Done"

uninstall_snippets:
	@rm -fR $(XCODE_USER_SNIPPETS_DIR)/$(SNIPPETS_PREFIX)

uninstall_templates:
	rm -fR $(XCODE_USER_TEMPLATES_DIR)/$(TEMPLATES_DIR)
