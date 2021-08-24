readline = require('readline-sync');

console.log('Enter the length of the room in meters:');
length = Number(readline.prompt());

console.log('Enter the width of the room in meters:');
width = Number(readline.prompt());

meters = length * width;
feet = meters * 10.7639;

console.log(`The area of the room is ${meters.toFixed(2)} square meters (${feet} square feet).`);