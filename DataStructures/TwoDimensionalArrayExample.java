public class TwoDimensionalArrayExample {
    public static void main(String[] args) {
        // Declare and initialize a 2D array
        int[][] matrix = {
                { 1, 2, 3 },
                { 4, 5, 6 },
                { 7, 8, 9 }
        };
        // using hourglass pattern
        int sum = matrix[0][0] + matrix[0][1] + matrix[0][2] +
                matrix[1][1] +
                matrix[2][0] + matrix[2][1] + matrix[2][2];
        System.out.println("Sum of specific elements: " + sum);
    }
}
