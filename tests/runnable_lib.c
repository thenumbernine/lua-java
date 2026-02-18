// gcc -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" -shared -fPIC -o librunnable_lib.so runnable_lib.c
#include <jni.h>
#include <stdio.h>

JNIEXPORT void JNICALL Java_Runnable_run(JNIEnv * env) {
	printf("testing testing\n");
}
