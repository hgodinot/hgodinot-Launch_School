let rlSync = require('readline-sync');

function askName (prompt) {
  name = rlSync.question(prompt);
  return name;
}

first_name = askName("What's your first name? ");
last_name = askName("What's your last name? ");
console.log(`Hello ${first_name} ${last_name}!`);