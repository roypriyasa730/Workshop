public class BinarySearch {
    public static int binarySearchIterative(int[] arr, int target) {
        int low = 0;
        int high = arr.length - 1;

        while (low <= high) {
            int mid = low + (high - low) / 2; // Calculate the mid-point to avoid overflow

            // Check if the target is present at mid
            if (arr[mid] == target) {
                System.out.println("Element found at index: " + mid);
                return mid;
            }

            // If target is greater, ignore the left half
            if (arr[mid] < target) {
                low = mid + 1;
            }
            // If target is smaller, ignore the right half
            else {
                high = mid - 1;
            }
        }
        System.out.println("Element not found in the array.");

        return -1;
    }

    public static void main(String[] args) {
        int[] arr = { 2, 3, 4, 10, 40 };
        int target = 10;
        binarySearchIterative(arr, target);
    }
}

// NextGreatestLetter.java
// LeetCode Problem: Find Smallest Letter Greater Than Target
class NextGreatestLetterSolver {

    public char nextGreatestLetter(char[] letters, char target) {
        int left = 0;
        int right = letters.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (letters[mid] <= target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return letters[left % letters.length];
    }
}
