package competition.warmup;

import tdl.client.Client;
import tdl.client.ProcessingRules;
import tdl.client.actions.ClientAction;

import static tdl.client.actions.ClientActions.publish;
import static tdl.client.actions.ClientActions.stop;

/**
 * Created by julianghionoiu on 23/08/2015.
 */
public class Run {

    //~~~~~~~~~~~~~~ Setup ~~~~~~~~~~~~~~

    public static ClientAction publishIf(boolean ready) {
        if (ready) {
            return publish();
        } else {
            return stop();
        }
    }


    /**
     * If you want to trial run: ./gradlew run -Dready=false
     * Go live:                  ./gradlew run -Dready=true
     */
    public static void main(String[] args) throws Exception {
        boolean ready = false;
        if (args.length > 0) {
            ready = Boolean.parseBoolean(args[0]);
        }
        System.out.println("Ready ? = "+ready);

        startClient(ready);
    }

    private static void startClient(final boolean ready) {
        Client client = new Client.Builder()
                .setHostname("localhost")
                .setPort(61616)
                .setUsername("iulian")
                .create();

        ProcessingRules processingRules = new ProcessingRules() {{
            on("display_description").call(Run::displayDescription).then(publish());
            on("sum").call(App::sum).then(publishIf(ready));
        }};

        client.goLiveWith(processingRules);
    }

    //~~~~~~~ User implementations ~~~~~~~~~~~~~~

    private static String displayDescription(String[] params) {
        return displayDescription(params[0], params[1]);
    }

    private static String displayDescription(String roundId, String info) {
        System.out.println("Starting round: "+roundId);
        System.out.println(info);
        return "OK";
    }

}
