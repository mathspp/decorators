publish:
	jb build --all .
	ghp-import -npf _build/html -c decorators.mathspp.com
