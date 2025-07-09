import java.util.Arrays;

public class SimpleArraySum {
    public static int sumWithForLoop(int[] arr) {
        int sum = 0;
        for (int i = 0; i < arr.length; i++) {
            sum = sum + arr[i];
        }
        return sum;
    }

    public static int sumWithFor(int[] arr) {
        int sum = 0;
        for (int i : arr) {
            sum += i;
        }
        return sum;
    }

    public static int sumWithForEach(int[] arr) {
        int sum = Arrays.stream(arr).sum();
        return sum;
    }

    public static void main(String[] args) {
        int[] arr = { 1, 2, 3, 4, 5 };
        int r = sumWithForEach(arr);
        System.out.println("Sum of array : " + r);
    }
}