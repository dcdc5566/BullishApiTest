package bullish;


import java.io.File;
import java.util.*;
import org.apache.commons.io.FileUtils;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import com.intuit.karate.Results;

import com.intuit.karate.Runner;

import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.Test;

public class getStudentTest {
    
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

    @Test
    void testParallel() 
    
    {

        Results results = Runner.path("classpath:bullish").outputCucumberJson(true).parallel(4);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
