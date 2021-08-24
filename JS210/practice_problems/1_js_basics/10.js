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

function signedIntegerToString(int) {
  if (int < 0) {
    return "-" + integerToString(-int);
  } else if (int > 0) {
    return "+" + integerToString(int);
  } else {
    return integerToString(int);
  }
}


console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"