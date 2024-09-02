package apifeatures;

import com.intuit.karate.junit5.Karate;

public class RunnerTest {

    @Karate.Test
    Karate testOne() {
        //return Karate.run("CreateAirline").relativeTo(getClass());
        return Karate.run("classpath:apifeatures");
    }
}
