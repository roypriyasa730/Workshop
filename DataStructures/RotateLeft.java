public class RotateLeft {

    public static void main(String args[]) {
        int[] n = { 1, 2, 3, 4, 5 };
        int d = 2; // Number of positions to rotate

        System.out.print("input Array: ");
        for (int i = 0; i < n.length; i++) {
            System.out.print(n[i] + " ");
        }
        System.out.println();

        for (int i = 0; i < d; i++) {
            int frist = n[0];

            for (int j = 0; j < n.length - 1; j++) {
                n[j] = n[j + 1]; // Shift elements to the left
            }

            n[n.length - 1] = frist;

        }
        System.out.println("Array after rotation: ");
        for (int i = 0; i < n.length; i++) {
            System.out.print(n[i] + " ");
        }
        System.out.println();
    }
}
