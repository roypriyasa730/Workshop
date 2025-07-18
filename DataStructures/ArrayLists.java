import java.util.List;
import java.util.ArrayList;

public class ArrayLists {

    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();

        // Add elements to the ArrayList
        list.add(10);
        list.add(20);
        list.add(30);
        list.add(40);
        list.add(60);
        list.add(70);

        // Print the ArrayList
        System.out.println("Arraylist :" + list);

        // get an element from the ArrayList
        int element = list.get(0);
        System.out.println("GetElement" + element);

        // set an element in the ArrayList
        list.set(0, 50);
        System.out.println(list);

        // remove an element from the ArrayList
        list.remove(0);
        System.out.println(list);

        // size of the ArrayList
        int size = list.size();
        System.out.println(size);

        // loop through the ArrayList
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));

        }
        System.out.println();

        // sum of all elements in the list

        int sum = 0;
        for (int i = 0; i < list.size(); i++) {
            sum += list.get(i);
            System.out.println("Sum of elements: " + sum);
        }
    }
}