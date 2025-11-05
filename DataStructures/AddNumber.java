import java.util.Scanner;

public class AddNumber {
    public static void main(String[] args) {
        // Use try-with-resources to ensure Scanner is closed automatically
        try (Scanner input = new Scanner(System.in)) {

            System.out.print("Enter first number: ");
            int num1 = input.nextInt();
            input.nextLine(); // Consume the newline character

            System.out.print("Enter second number: ");
            int num2 = input.nextInt();
            input.nextLine(); // Consume the newline character

            System.out.print("Enter third number: ");
            int num3 = input.nextInt();
            input.nextLine(); // Consume the newline character

            int sum = num1 + num2 + num3;

            System.out.println("Sum = " + sum);
        }
    }

}
