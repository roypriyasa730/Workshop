import java.util.ArrayList;
import java.util.List;

public class DynamicArray {
    public static void main(String[] args) {

        List<List<Integer>> queries = new ArrayList<>();

        queries.add(List.of(1, 0, 5));
        queries.add(List.of(1, 1, 7));
        queries.add(List.of(1, 0, 3));
        queries.add(List.of(2, 1, 0));
        queries.add(List.of(2, 1, 1));
        int n = 2;
        List<List<Integer>> array = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            array.add(new ArrayList<>());

        }

    }

}