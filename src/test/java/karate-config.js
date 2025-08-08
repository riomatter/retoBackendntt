function fn() {

  var config ={
    authURL: 'https://dev-457931.okta.com/oauth2/aushd4c95QtFHsfWt4x6/v1/token',
    scope: 'offline_access',
    grant_type: 'password',
    username: 'api-user4@iwt.net',
    password: 'b3z0nV0cLO',
    client_id: '0oahdhjkutaGcIK2M4x6',
    URL: 'https://jsonplaceholder.typicode.com/',
    emailROLEADMIN: 'admin@wisermeeting.com',
    passwordROLEADMIN: 'altimea202323'
  };
  karate.log('Loaded karate-config.js successfully');
  return config;
}