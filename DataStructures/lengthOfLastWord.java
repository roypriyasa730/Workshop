public class lengthOfLastWord {

    public static void main(String[] args) {
        String s = "Hello World";
        int length = lengthOfLastWord(s);
        System.out.println("Length of last word: " + length);
    }

    public static int lengthOfLastWord(String s) {
        int length = 0;
        int i = s.length() - 1;

        // Skip trailing spaces
        while (i >= 0 && s.charAt(i) == ' ') {
            i--;
        }

        // Count the length of the last word
        while (i >= 0 && s.charAt(i) != ' ') {
            length++;
            i--;
        }

        return length;
    }
}