package competition.warmup;


import tdl.client.Client;
import tdl.client.abstractions.ImplementationMap;

/**
 * Created by julianghionoiu on 23/08/2015.
 */
public class App {


    public static void main(String[] args) throws Exception {
        Client client = new Client("localhost", 61616, "jgh");

        ImplementationMap implementations = new ImplementationMap();
        implementations.register("display_description", params ->  displayInfo(params[0]));
        implementations.register("display_required_methods", params -> displayInfo(params[0]));
        implementations.register("sum", params ->
                sum(Integer.valueOf(params[0]), Integer.valueOf(params[1]))
        );

        client.goLiveWith(implementations);
    }

    private static String displayInfo(String param) {
        System.out.println(param);
        return "OK";
    }

    public static Integer sum(Integer x, Integer y) {
        return null;
    }

}
