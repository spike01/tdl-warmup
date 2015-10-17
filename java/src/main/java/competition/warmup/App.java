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
        implementations.register("sum", params ->
                sum(Integer.valueOf(params[0]), Integer.valueOf(params[1]))
        );

        client.goLiveWith(implementations);
    }

    public static Integer sum(Integer x, Integer y) {
        return null;
    }

}
