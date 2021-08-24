function toLowerCase(string) {
  result = '';
  const CONVERSION_OFFSET = 32;

  for (i = 0; i < string.length; i += 1) {
    num = string[i].charCodeAt(0);

    if (num >= 65 && num <= 90 ) {
      num += CONVERSION_OFFSET;
    }

  result += String.fromCharCode(num);
  }

  return result;
}

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"