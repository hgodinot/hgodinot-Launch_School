let myArray = [1, 2, 3, 4];

let myOtherArray = myArray.slice();

/* Other way to do it:
let myOtherArray = [];

for (i = 0; i < myArray.length; i += 1) {
  myOtherArray[i] = myArray[i];
}
*/



myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);