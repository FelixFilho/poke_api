test:
	@echo "RL sucks"

br:
	@echo "Getting Flutter packages"
	flutter pub get
	@echo "Building dependencies"
	flutter pub run build_runner build --delete-conflicting-outputs

