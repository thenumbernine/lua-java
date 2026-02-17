public class Test {
	public Test() {
		System.out.println("Test:Test()");
	}

	public String foo = "bar";

	public int bar = 1;

	public double baz = 2;

	public static String test() { return "Testing"; }

	public String ol(int a) { return "ol_a"; }
	public String ol(double b) { return "ol_b"; }
	public String ol(String c) { return "ol_c"; }
	public String ol(Object d) { return "ol_d"; }
	public String ol(char[] e) { return "ol_e"; }
}
