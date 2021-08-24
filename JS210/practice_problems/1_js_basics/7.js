function charToNum(str) {
  const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  return DIGITS.indexOf(str);
}


function stringToInteger(str) {
  return str.split('').reduce((acc, el) => acc * 10 + charToNum(el));
}

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570



