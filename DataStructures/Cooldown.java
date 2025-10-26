public class Cooldown {
    public static void main(String[] args) {
        int cooldownTime = 10; // cooldown time in seconds
        System.out.println("Action performed! Starting cooldown...");

        for (int i = cooldownTime; i >= 0; i--) {
            System.out.println("Cooldown: " + i + " seconds remaining");
            try {
                Thread.sleep(1000); // wait for 1 second
            } catch (InterruptedException e) {
                System.out.println("Cooldown interrupted");
                return;

            }

        }

        System.out.println("Cooldown complete! You can perform the action now.");
    }

}
