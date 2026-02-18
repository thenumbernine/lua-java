public class TestRunRunnable {
	public static void main(String[] args) {
		// must be run with java -Djava.library.path=.
		new TestNativeRunnable(0,0).run();
	}
}
