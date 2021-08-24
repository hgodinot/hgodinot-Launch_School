const ROTATION = 13;

const CAPITAL_START = 'A'.charCodeAt(); // 65
const CAPITAL_HALF = 'M'.charCodeAt(); // 77
const CAPITAL_END = 'Z'.charCodeAt(); // 90

const LOWER_START = 'a'.charCodeAt(); // 97
const LOWER_HALF = 'm'.charCodeAt(); // 109
const LOWER_END = 'z'.charCodeAt(); // 122

function isLetter(num) {
  return ((num >= CAPITAL_START && num <= CAPITAL_END) || 
          (num >= LOWER_START && num <= LOWER_END));
}

function isFirstHalf(num) {
  return (num <= CAPITAL_HALF) || (num >= LOWER_START && num <= LOWER_HALF);
}

function rotateLetter(num) {
  if (isFirstHalf(num)) {
    num += ROTATION;
  } else {
    num -= ROTATION;
  }

  return String.fromCharCode(num);
}

function rot13(string) {
  result = '';

  for (let i = 0; i < string.length; i += 1) {
    let number = string[i].charCodeAt();
    let char = string[i];
    //console.log(char);

    if (isLetter(number)) {
      char = rotateLetter(number);
    }
    //console.log(char);
    result += char;
  }

  return result;
}

// Tests:

console.log( rot13('Teachers open the door, but you must enter by yourself.') === 'Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.');

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')) === 'Teachers open the door, but you must enter by yourself.');

console.log(rot13('[\\]^_`') === '[\\]^_`');

console.log(rot13('{|}~') === '{|}~');