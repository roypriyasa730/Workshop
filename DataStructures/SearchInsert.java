public class SearchInsert {
    public static int searchInsert(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] >= target) {
                return i;
            }
        }
        // If target is greater than all elements, return the length of the array
        return nums.length;
    }
}
