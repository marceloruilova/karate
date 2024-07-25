function fn() {
  let env = karate.env;
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  let config = {
    env: env,
    myVarName: 'someValue'
  }
  return config;
}