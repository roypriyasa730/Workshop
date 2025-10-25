public class Main {
    public static void main(String[] args) {
        String studentName = "Priyasa Roy";
        int studentID = 3087;
        int studentAge = 23;
        float studentFee = 75.25f;
        char studentGrade = 'B';

        System.out.println("Hello world!");
        // System.out.println(1000);

        System.out.println("Student name: " + studentName);
        System.out.println("Student id: " + studentID);
        System.out.println("Student age: " + studentAge);
        System.out.println("Student fee: " + studentFee);
        System.out.println("Student grade: " + studentGrade);

        int x = 5;
        int y = 3;

        if (x > y) {
            System.out.println("x is greater than y");
        } else {
            System.out.println("x is not greater than y");
        }

        int year = 2024; // Example year

        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
            System.out.println(year + " is a Leap Year.");
        } else {
            System.out.println(year + " is not a Leap Year.");
        }

        System.out.println(x - y);
        System.out.println(x + y);

        String FirstName = "Priyasa";
        String LastName = "Roy";
        System.out.println(FirstName + " " + LastName);

    }
}