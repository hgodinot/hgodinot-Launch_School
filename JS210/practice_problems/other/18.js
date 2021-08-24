function trim(str) {
  let result = '';
  let candidate = '';
  let length = str.length;

  for (i = 0; i < length; i += 1) {
    if (str[i] === ' ' && result !== '') {
      candidate += ' ';
    } else if (str[i] !== ' ') {
      candidate += str[i];
      result += candidate;
      candidate = '';
    }
  }

  return result;
}

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""