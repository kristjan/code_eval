import java.io.*;

class lcs {
  public static String lcs(String a, String b) {
    if (a.length() == 0 || b.length() == 0) return "";
    if (a.charAt(0) == b.charAt(0)) {
      return a.charAt(0) + lcs(a.substring(1), b.substring(1));
    } else {
      String drop_a = lcs(a.substring(1), b);
      String drop_b = lcs(a, b.substring(1));
      return (drop_a.length() > drop_b.length() ? drop_a : drop_b);
    }
  }

  public static void main(String[] argv) {
    String line;
    try {
      BufferedReader in = new BufferedReader(new FileReader(argv[0]));
      while ((line = in.readLine()) != null) {
        if (line.length() == 0) continue;
        String[] pieces = line.split(";");
        if (pieces.length < 2) continue;
        System.out.println(lcs(pieces[0], pieces[1]));
      }
    } catch (Exception bang) {
      System.out.println("Error: " + bang.getMessage());
    }
  }
}
