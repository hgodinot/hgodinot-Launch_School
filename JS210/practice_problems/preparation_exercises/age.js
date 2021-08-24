/*
let readline = require('readline-sync');

let age = Number(readline.question("What is your age? "));
let years = 0;

console.log('You are ' + age + ' years old.');

while (years < 40) {
  years += 10;
  console.log(`In ${years} years, you will be ${age + years} years old.`);
}
*/

let readline = require('readline-sync');

let age = Number(readline.question("What is your age? "));

console.log('You are ' + age + ' years old.');

for (let years = 10; years < 40; years += 10) {
  console.log(`In ${years} years, you will be ${age + years} years old.`);
};