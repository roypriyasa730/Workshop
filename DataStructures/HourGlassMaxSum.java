import java.util.Arrays;
import java.util.List;

public class HourGlassMaxSum {
    public static void main(String[] args) {
        // Declare and initialize a 2D array
        List<List<Integer>> matrix = Arrays.asList(
                Arrays.asList(1, 1, 1, 0, 0, 0),
                Arrays.asList(0, 1, 0, 0, 0, 0),
                Arrays.asList(1, 1, 1, 0, 0, 0),
                Arrays.asList(0, 0, 2, 4, 4, 0),
                Arrays.asList(0, 0, 0, 2, 0, 0),
                Arrays.asList(0, 0, 1, 2, 4, 0));
        int[] sumList = new int[16];
        int index = 0;
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                // Calculate hourglass sum
                sumList[index++] = matrix.get(i).get(j) + matrix.get(i).get(j + 1) + matrix.get(i).get(j + 2)
                        + matrix.get(i + 1).get(j + 1) +
                        matrix.get(i + 2).get(j) + matrix.get(i + 2).get(j + 1) + matrix.get(i + 2).get(j + 2);
            }
            for (int j = 0; j < 4; j++) {
                // Calculate hourglass sum
                sumList[index++] = matrix.get(i).get(j) + matrix.get(i).get(j + 1) + matrix.get(i).get(j + 2)
                        + matrix.get(i + 1).get(j + 1) +
                        matrix.get(i + 2).get(j) + matrix.get(i + 2).get(j + 1) + matrix.get(i + 2).get(j + 2);
            }
        }
        // Print all sum values
        for (int sum : sumList) {
            System.out.println(sum);
        }
        // Find the maximum hourglass sum
        int maxSum = Integer.MIN_VALUE;
        for (int sum : sumList) {
            if (sum > maxSum) {
                maxSum = sum;
            }
        }
        System.out.println("Maximum Hourglass Sum: " + maxSum);
    }
}
