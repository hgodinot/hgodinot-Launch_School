function repeatedCharacters(str) {
  let result = {};
  let charArray = str.split('').map(char => char.toLowerCase());

  charArray.forEach(char => {
    if (str.indexOf(char) === str.lastIndexOf(char)) return;
    result[char] ? result[char] += 1 : result[char] = 1;
  });

  return result;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
