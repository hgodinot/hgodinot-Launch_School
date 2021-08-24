readline = require('readline-sync');

console.log("Enter score 1:");
score1 = Number(readline.prompt());

console.log("Enter score 2:");
score2 = Number(readline.prompt());

console.log("Enter score 3:");
score3 = Number(readline.prompt());

average = (score1 + score2 + score3) / 3;
let grade = 'F';

if (average >= 90) {
  grade = 'A';
} else if (average >= 70) {
  grade = 'B';
} else if (average >= 50) {
  grade = 'C';
}

console.log(`Based on the average of your 3 scores your letter grade is "${grade}".`);