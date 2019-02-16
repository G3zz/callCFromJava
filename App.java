public class App {

    // declare the native method
    private native void helloWorld();

    public static void main(String[] args ) {
        new App().helloWorld();
    }

    // static class initialiser
    static {
        // Loads a static shared library
        // into memory.

        // Looks like dynamic linking is possible, though:
	// https://www.ibm.com/support/knowledgecenter/en/SSYKE2_8.0.0/com.ibm.java.vm.80.doc/docs/jni_runtime_linking.html
        System.loadLibrary("SharedLibrary");
    }

}
