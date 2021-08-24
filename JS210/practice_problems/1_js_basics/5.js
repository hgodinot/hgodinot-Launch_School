const readlineSync = require("readline-sync");

console.log("Enter the first number:\n");
first = Number(readlineSync.prompt());

console.log("Enter the second number:\n");
second = Number(readlineSync.prompt());

console.log(`${first} + ${second} = ${first + second}`);
console.log(`${first} - ${second} = ${first - second}`);
console.log(`${first} * ${second} = ${first * second}`);
console.log(`${first} / ${second} = ${first / second}`);
console.log(`${first} % ${second} = ${first % second}`);
console.log(`${first} ** ${second} = ${first ** second}`);

/*
=> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 1.4105003956066297e+23
*/
