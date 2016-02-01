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
            on("display_description").call(Run::displayInfo).then(publish());
            on("display_required_methods").call(Run::displayInfo).then(publish());
            on("sum").call(App::sum).then(publishIf(ready));
        }};

        client.goLiveWith(processingRules);
    }

    //~~~~~~~ User implementations ~~~~~~~~~~~~~~

    private static String displayInfo(String[] params) {
        return displayInfo(params[0]);
    }

    private static String displayInfo(String info) {
        System.out.println(info);
        return "OK";
    }

}
