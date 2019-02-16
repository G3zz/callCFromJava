JDK="/usr/lib/jvm/java-1.8-openjdk"
LIB="libSharedLibrary.so"

container: image
	docker run -it --rm call-c-from-java:latest

image: 	Dockerfile
	docker build -t call-c-from-java:latest .

classes: install
	javac App.java	

install: library
	mv ${LIB} /usr/lib/

.PHONY: library
library:
	gcc -I${JDK}/include -I${JDK}/include/linux -shared -fpic -o ${LIB} c/App.c

.PHONY:	headers
headers:
	javac -h c/includes App.java

.PHONY: clean
clean:
	docker image rm call-c-from-java:latest

uninstall: clean
	rm /usr/lib/${LIB}
