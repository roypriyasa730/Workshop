public class PrimeBasic {
    public static void main(String[] args) {
        int number = 12;

        boolean isPrime = true;

        if (number <= 1) {
            isPrime = false;
            System.out.println(number + " is NOT a Prime number.");

        } else {
            for (int i = 2; i < number; i++) {
                if (number % i == 0) {
                    isPrime = false;
                    break;
                }
            }
        }

        if (isPrime) {
            System.out.println(number + " is a Prime number.");
        } else {
            System.out.println(number + " is NOT a Prime number.");
        }
    }
}
