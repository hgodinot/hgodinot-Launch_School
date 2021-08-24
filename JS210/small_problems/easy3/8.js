let swap = (str) => str.split(' ').map(wrd => wrd.split('').reverse().join('')).join(' ');

/* Or in several lines (clearer):

function swap(str) {
  return str.split(' ')
     .map(wrd => wrd
     .split('')
     .reverse()
     .join(''))
     .join(' ');
}

*/

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"
