function isNotANumber(num) {
  return (typeof(num) === 'number' && (num !== num));
}

console.log(isNotANumber(NaN));
console.log(isNotANumber(0/0));
console.log(isNotANumber(7));
console.log(isNotANumber('string'));