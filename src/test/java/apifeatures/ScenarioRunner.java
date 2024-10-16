package apifeatures;


import apifeatures.ReportHook;
import com.aventstack.extentreports.ExtentReports;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;
import static com.intuit.karate.Runner.parallel;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class ScenarioRunner {
   
	@Test
    void testParallel(){
		System.setProperty("karate.env", "qa");

       Results results = Runner.path("classpath:apifeatures")
                       .hook(new ReportHook())
                               .parallel(1);
      // assertEquals(0, results.getFailCount(), results.getErrorMessages());
   }


}
