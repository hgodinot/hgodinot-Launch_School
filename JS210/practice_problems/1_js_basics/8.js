function charToNum(str) {
  const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  return DIGITS.indexOf(str);
}


function stringToInteger(str) {
  let multiplicator = 1;

  if (['-', '+'].includes(str[0])) {
    if (str[0] === '-') multiplicator = -1;
    str = str.slice(1, str.length);
  }

  return str.split('').reduce((acc, el) => acc * 10 + charToNum(el)) * multiplicator;
}

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('-570'));       // -570
console.log(stringToInteger('+100'));      // 100)