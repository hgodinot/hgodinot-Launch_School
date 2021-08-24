function rotateArray(arr) {
  if (!Array.isArray(arr)) return undefined;
  return arr.length > 0 ? arr.slice(1).concat(arr[0]) : [];
}

function rotateRightmostDigits(num, idx) {
  let arr = String(num).split('').map(Number);

  let firstHalf = arr.slice(0, arr.length - idx)
  let secondHalf = rotateArray(arr.slice(-idx));

  return Number([...firstHalf, ...secondHalf].join(''));
}

function maxRotation(number) {
  let digits = String(number).length;

  for (let i = digits; i > 1; i -= 1) {
    number = rotateRightmostDigits(number, i);
  }

  return number;
}

console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845
