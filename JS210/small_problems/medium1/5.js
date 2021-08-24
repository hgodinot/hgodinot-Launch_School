const NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

function wordToDigit(str) {
  NUMBERS.forEach((num, idx) => {
    let number = new RegExp(num, 'gi');
    str = str.replace(number, idx);
  })
  return str;
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."