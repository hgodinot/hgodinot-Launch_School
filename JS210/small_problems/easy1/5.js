readline = require('readline-sync');

let num = Number(readline.question('Please enter an integer greater than 0: '));

let choice = readline.question('Enter "s" to compute the sum, or "p" to compute the product. ');

let result = 1;
let operation = '';

if (choice === 's') {
  operation = 'sum';
  for (i = 2; i <= num; i += 1) {
    result += i;
  }
} else {
  operation = 'product';
  for (i = 1; i <= num; i += 1) {
    result *= i;
  }
}

console.log(`The ${operation} of the integers between 1 and ${num} is ${result}.`);