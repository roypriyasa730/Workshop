public class SearchRange {

    public static int[] searchRange(int[] nums, int target) {

        int leftIndex = binarySearch(nums, target);
        int rightIndex = binarySearch(nums, target + 1);

        if (leftIndex == rightIndex) {
            return new int[] { -1, -1 };
        }

        return new int[] { leftIndex, rightIndex - 1 };
    }

    // Binary search to find the leftmost index of the target value
    private static int binarySearch(int[] nums, int value) {
        int left = 0; // int right = nums.length - 1;
        int right = nums.length;

        while (left < right) {

            int mid = (left + right) / 2;

            if (nums[mid] >= value) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        return left;
    }

    // Main method to test

    public static void main(String[] args) {

        int[] nums = { 5, 7, 7, 8, 8, 10 };
        int target = 8;
        // Call the searchRange method
        int[] result = searchRange(nums, target);

        // Print the result
        System.out.println("Start Index: " + result[0]);
        System.out.println("End Index: " + result[1]);
    }
}
