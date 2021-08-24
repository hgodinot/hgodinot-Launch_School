let apples = 3;
let bananas = 5;

function test(first, second) {
  if (first === second) { 
  console.log(`${first} is equal to ${second}!`);
  }
  else {
    if (first == second) {
      console.log(`${first} and ${second} are not the same type but are equal once converted!`);
    } else {
      console.log(`${first} is not equal to ${second}!`);
    }
  }
}

test(apples, bananas);

bananas = '3';

test(apples, bananas);

apples = 3;
bananas = 3;

let areEqual = (apples === bananas);
console.log(areEqual);

bananas = undefined;

eitherOr = (bananas || apples);
console.log(eitherOr);

let lastName = 'Doe';
let familyName = 'Doe';

console.log( lastName === familyName? "You're part of the family!" : "You're not family.");
