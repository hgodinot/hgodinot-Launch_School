const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function integerToString(int) {
  let numArray = [];
  
  do {
    digit = int - (Math.floor(int / 10) * 10);
    int = (int - digit) / 10;
    numArray.unshift(digit);
  } while (int >= 1);
  
  return numArray.reduce((acc, el) => acc + DIGITS[el], "")
}

console.log(integerToString(4321) == "4321");
console.log(integerToString(0) === "0");
console.log(integerToString(5000) === "5000");