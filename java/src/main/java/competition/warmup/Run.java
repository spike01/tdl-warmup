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

    /**
     * ~~~  How to run ~~~
     *
     * From command line:
     *    If you want to trial run:     ./gradlew run
     *    If you are ready to go live:  ./gradlew run -Dready=true
     *
     * From IDE:
     *    Run this class from IDE.
     *    Set the ARE_YOU_READY variable to "true" if ready to go live
     */
    private static final boolean ARE_YOU_READY = false;

    @SuppressWarnings({"PointlessBooleanExpression", "ConstantConditions"})
    public static void main(String[] args) throws Exception {
        boolean valueFromCommandline = args.length > 0 && Boolean.parseBoolean(args[0]);
        boolean ready = ARE_YOU_READY || valueFromCommandline;
        System.out.println("Ready ? = "+ready);

        startClient(ready);
    }

    private static void startClient(final boolean ready) {
        Client client = new Client.Builder()
                .setHostname("localhost")
                .setUsername("julian")
                .create();

        ProcessingRules processingRules = new ProcessingRules() {{
            on("display_description").call(Run::displayDescription).then(publish());
            on("sum").call(App::sum).then(publishIf(ready));
        }};

        client.goLiveWith(processingRules);
    }

    public static ClientAction publishIf(boolean ready) {
        return ready ? publish() : stop();
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
