const readlineSync = require("readline-sync");

console.log("Please enter a phrase: ");
let string= readlineSync.prompt();
let length = string.length;

console.log(`There are ${length} characters in "${string}".`);

