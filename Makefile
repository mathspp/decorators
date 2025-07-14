all: build publish

build:
	jb build --all .

publish:
	ghp-import -npf _build/html -c decorators.mathspp.com
