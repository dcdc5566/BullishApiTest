# Web Service Testing With Karate

This sample project includes api testing with Karate

# Getting Started (Gereksinimler) :heavy_check_mark:
Karate requires Java 8 (at least version 1.8.0_112 or greater)
https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html 
 
**Vistual Studio**
https://visualstudio.microsoft.com/downloads/ (Maven, Gradle installed.)

**Karate Plugin**
(Karate for java)

**Mock Server setup**

# Running Code 
```
maven clean install
maven test
```    
**Report**
We have two kind of reports in this project change your home directory name this link for the backup report 

Cucumber reports 
file:///Users/deepali/project/buliishApiTest/Backup_reports/cucumber-html-reports/overview-features.html




Karate Reports 

/Users/deepali/project/buliishApiTest/Backup_reports/karate-reports/karate-summary.html

Cucumber reporting 
**Implemneted Features**
- Karate Cucumber reporting improvements 
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  33.199 s
[INFO] Finished at: 2022-05-16T19:42:23+08:00
[INFO] ------------------------------------------------------------------------




- Paralle run time reduce by 5 sec Number of thread is 4

[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  29.181 s
[INFO] Finished at: 2022-05-16T19:43:38+08:00
[INFO] ------------------------------------------------------------------------

 Stored response in data file and assert in Feature files 
- Create unique username and send request and get response
- Implemneted Token api for simple authentication get access token and run before every feature 
- One time token and genric header step up 
- Implemneted Senario out line in GET_Student.feature
- Implemented Helper/CreateToken.feature and calling before every feature file through config file 
- Data type for repsonse validation