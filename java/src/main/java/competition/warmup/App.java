package competition.warmup;

/**
 * Created by julianghionoiu on 23/08/2015.
 */
public class App {

    public static Integer sum(String[] params) {
        Integer x = Integer.parseInt(params[0]);
        Integer y = Integer.parseInt(params[1]);
        return sum(x, y);
    }

    public static Integer sum(Integer x, Integer y) {
        return x + y;
    }

}
