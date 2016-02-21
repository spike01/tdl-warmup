package competition.warmup;

import com.google.common.io.Files;
import tdl.client.Client;
import tdl.client.ProcessingRules;
import tdl.client.actions.ClientAction;

import java.io.File;
import java.io.IOException;

import static tdl.client.actions.ClientActions.publish;
import static tdl.client.actions.ClientActions.stop;

/**
 * Created by julianghionoiu on 23/08/2015.
 */
public class Run {
    private static final boolean I_AM_READY = false;

    /**
     * ~~~  How to run ~~~
     *
     * From command line:
     *    If you want to trial run:     ./gradlew run
     *    If you are ready to go live:  ./gradlew run -Dready=true
     *
     * From IDE:
     *    Run this class from IDE.
     *    Set the I_AM_READY variable to "true" if ready to go live
     */
    @SuppressWarnings({"PointlessBooleanExpression", "ConstantConditions"})
    public static void main(String[] args) throws Exception {
        boolean valueFromCommandline = args.length > 0 && Boolean.parseBoolean(args[0]);
        boolean ready = I_AM_READY || valueFromCommandline;
        System.out.println("Ready ? = "+ready);

        startClient(ready);
    }

    private static void startClient(final boolean ready) {
        Client client = new Client.Builder()
                .setHostname("localhost")
                .setUsername("julian")
                .create();

        ProcessingRules processingRules = new ProcessingRules() {{
            on("display_description").call(p -> displayAndSaveDescription(p[0], p[1])).then(publish());
            on("sum").call(p -> App.sum(asInt(p[0]), asInt(p[1]))).then(publishIf(ready));
        }};

        client.goLiveWith(processingRules);
    }

    public static ClientAction publishIf(boolean ready) {
        return ready ? publish() : stop();
    }

    //~~~~~~~ Provided implementations ~~~~~~~~~~~~~~

    private static String displayAndSaveDescription(String label, String description) {
        System.out.println("Starting round: "+label);
        System.out.println(description);

        //Save description
        File output = new File("challenges" + File.separator + label + ".txt");
        try {
            Files.write(description.getBytes(), output);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Challenge description saved to file: "+output.getPath()+".");

        return "OK";
    }

    private static double asNumber(String s) {
        return Double.parseDouble(s);
    }

    private static int asInt(String s) {
        return Integer.parseInt(s);
    }
}
