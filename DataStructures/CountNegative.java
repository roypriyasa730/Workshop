public class CountNegative {

    public int countNegatives(int[][] grid) {
        int count = 0;
        for (int i = 0; i < grid.length; i++) {
            int[] row = grid[i];
            for (int j = 0; j < row.length; j++) {
                if (row[j] < 0) {
                    count++;
                }
            }
        }
        return count;
    }
}
