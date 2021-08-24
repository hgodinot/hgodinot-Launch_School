function crunch(str) {
  let newString = '';
  let lastChar = '';

  for (let i = 0; i < str.length; i += 1) {
    if (str[i] !== lastChar) {
      lastChar = str[i];
      newString += lastChar;
    }
  }

  return newString;
}

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""