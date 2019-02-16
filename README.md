# Call C from Java
This repository demonstrates how to compile a simple "Hello World" example using the Java Native Interface (JNI) to call a shared library written in C.

# Building and running the example

# With Docker
Build the image with `docker build -t call-c-from-java:latest .` and run it
with `docker run -it --rm call-c-from-java:latest`.

# With gcc and javac

First compile the java source using `javac App.java`
Then compile the c source into a shared library, passing in the appropriate jvm includes:

    gcc -I/usr/lib/jvm/java-1.8-opendjdk/include -I/usr/lib/jvm/java-1.8-opendjdk/include/linux -shared -fpic -o libSharedLibrary.so c/App.c

Finally, run the application, adding the shared library to the java library path:

    java -Djava.library.path=./libSharedLibrary.so App
    
N.B. If running on Windows, substitute `libSharedLibrary.so` with `SharedLibrary.dll`

# Explanation

## Java:
The Java file `App.java` declares the native `HelloWorld()` function using the `native` keyword and invokes
it in its main method. The `static` loader loads the appropriate shared library containing `HelloWorld()`, namely `libSharedLibrary.so`, at class loadtime.

## C
The C header file `App.h` is created using `javac -h App.java`.  This file contains a method stub derived from the method signature specified by the `native` declaration in `App.java`.
The stub is implemented in `App.c`, and defined to print "Hello from C!" to stdout.  In order to create a dynamic shared library, the `-shared` and `-fpic` flags are passed to `gcc`. These flags
instruct `gcc` to create a shared library using position independent code. This means that the library can be executed from any memory location, therefore making it a dynamic library.
