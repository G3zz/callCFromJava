#include <stdio.h>
#include <jni.h>
#include "App.h"

/*
 * Class:     App
 * Method:    helloWorld
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_App_helloWorld (JNIEnv *env, jobject object) {
    printf("Hello from C!\n");
}
