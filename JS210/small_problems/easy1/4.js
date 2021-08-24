readline = require('readline-sync');

console.log('What is the bill?');
bill = Number(readline.prompt());

console.log('What is the tip percentage?');
percentage = Number(readline.prompt());

tip = bill * percentage / 100;

console.log(`The tip is $${tip.toFixed(2)}`);
console.log(`The total is $${(tip + bill).toFixed(2)}`);