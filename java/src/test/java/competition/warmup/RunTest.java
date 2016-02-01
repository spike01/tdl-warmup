package competition.warmup;

import org.junit.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

/**
 * Created by julianghionoiu on 23/08/2015.
 */
public class RunTest {

    @Test
    public void compute_sum() {
        assertThat(App.sum(1, 1), equalTo(2));
    }
}