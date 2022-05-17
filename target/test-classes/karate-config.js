 function fn() {
  var config = {
    apiURL: 'http://localhost:9080/',
    username : 'test',
    password : 'test'

    

  };

  karate.configure('logPrettyRequest', true)
  karate.configure('logPrettyResponse', true)
  
  config.faker = Java.type('com.github.javafaker.Faker');


  // var accessToken = karate.callSingle('classpath:Helper/CreateToken.feature' ,config).token
   karate.configure('headers',{ Accept :'application/json'})
  return config;
}