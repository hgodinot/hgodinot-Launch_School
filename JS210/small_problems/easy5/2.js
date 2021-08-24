const CONSONANTS = 'bcdfghjklmnpqrstvwxyz';

let doubleConsonants = (str, num = 2) => str.split('').map(chr => {
  return CONSONANTS.includes(chr.toLowerCase())? chr.repeat(num) : chr;
}).join('');

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants('July 4th', 3));        // "JJJulllyyy 4ttthhh"
console.log(doubleConsonants(''));                // ""