const password = 'password'
let tryCount = 0;
let readline = require('readline-sync');


while (tryCount < 3) {
  console.log("What is the password.");
  guess = readline.prompt();

  if (guess === password) {
    console.log("You have successfully logged in.");
    break;
  } else {
    tryCount += 1;
    if (tryCount === 3) console.log("You have been denied access.");
  }
}

