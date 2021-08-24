function isBlockWord(str) {
  let freeLetters = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], 
                   ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], 
                   ['V', 'I'], ['L', 'Y'], ['Z', 'M']];

  let arr = str.split('').map(chr => chr.toUpperCase());
 
  for (i = 0; i < arr.length; i += 1) {
    if (!freeLetters.flat().includes(arr[i])) {
      return false;
    } else {
      index = Math.floor(freeLetters.flat().indexOf(arr[i]) / 2);
      freeLetters.splice(index, 1);
    }
  }

  return true;
}

/*
Input: String
Output: boolean

Rules: 
Case insensitive. 
One of every couple of letters at the most
Empty string => return true ? (let's assume)

Data Structure:
convert string into array of upcase characters, and iterate one character at a time. 
For every character, return false if not part of the 13 subarrays array
  iterate over array of 13 subarrays with for loop
  If character included in one of the 13 blocks => remove this block

  Return true at the end


*/

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('floW'));       // true
console.log(isBlockWord('APPLE'));      // false
console.log(isBlockWord('apple'));      // false
console.log(isBlockWord('apPLE'));      // false
console.log(isBlockWord('Box'));        // false
console.log(isBlockWord(''));       // true
console.log(isBlockWord(' '));       // false