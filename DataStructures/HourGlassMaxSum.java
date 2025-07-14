public class HourGlassMaxSum {
    public static void main(String[] args) {
        // Declare and initialize a 2D array
        int[][] matrix = {
                { 1, 1, 1, 0, 0, 0 },
                { 0, 1, 0, 0, 0, 0 },
                { 1, 1, 1, 0, 0, 0 },
                { 0, 0, 2, 4, 4, 0 },
                { 0, 0, 0, 2, 0, 0 },
                { 0, 0, 1, 2, 4, 0 }
        };
        int[] sumList = new int[16];
        int index = 0;
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                // Calculate hourglass sum
                sumList[index++] = matrix[i][j] + matrix[i][j + 1] + matrix[i][j + 2]
                        + matrix[i + 1][j + 1] +
                        matrix[i + 2][j] + matrix[i + 2][j + 1] + matrix[i + 2][j + 2];
            }
            // System.out.println();
        }

        // Print all sum values
        for (int sum : sumList) {
            System.out.println(sum);
        }

    }
}
