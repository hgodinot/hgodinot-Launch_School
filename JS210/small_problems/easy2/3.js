function stringy(num) {
  return '10'.repeat(parseInt(num / 2)) + '1'.repeat(num % 2);
}

console.log(stringy(6));    // "101010"
console.log(stringy(9));    // "101010101"
console.log(stringy(4));    // "1010"
console.log(stringy(7));    // "1010101"