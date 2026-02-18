class Runnable {
    static {
        System.loadLibrary("runnable_lib");
    }

	public static native void run();
}
