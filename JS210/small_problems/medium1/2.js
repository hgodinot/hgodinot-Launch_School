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

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917