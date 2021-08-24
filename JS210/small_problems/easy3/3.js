readline = require('readline-sync');

let currentAge = readline.question('What is your age? ');
let retirementAge = readline.question('At what age would you like to retire?  ');
let currentYear = new Date().getFullYear();

let workingYears = retirementAge - currentAge;
let retirementYear = currentYear + workingYears;

console.log(`It's ${currentYear}. You will retire in ${retirementYear}.`);
console.log(`You have only ${workingYears} years of work to go!`);