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
                .setUsername("iulian")
                .create();

        ProcessingRules processingRules = new ProcessingRules() {{
            on("display_description").call(Run::displayDescription).then(publish());
            on("sum").call(App::sum).then(publishIf(ready));
        }};

        client.goLiveWith(processingRules);
    }

    public static ClientAction publishIf(boolean ready) {
        if (ready) {
            return publish();
        } else {
            return stop();
        }
    }

    //~~~~~~~ Provided implementations ~~~~~~~~~~~~~~

    private static String displayDescription(String[] params) {
        return displayDescription(params[0], params[1]);
    }

    private static String displayDescription(String label, String description) {
        System.out.println("Starting round: "+label);
        System.out.println(description);
        return "OK";
    }

}
