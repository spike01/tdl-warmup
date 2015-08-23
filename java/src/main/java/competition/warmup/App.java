package competition.warmup;

import competition.client.Client;

/**
 * Created by julianghionoiu on 23/08/2015.
 */
public class App {


    public static void main(String[] args) throws Exception {
        Client client = new Client("tcp://localhost:61616", "jgh");

        client.trialRunWith(params ->
                sum(Integer.valueOf(params[0]), Integer.valueOf(params[1]))
        );
    }

    public static Integer sum(Integer x, Integer y) {
        return null;
    }

}
