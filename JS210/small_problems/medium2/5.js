function uniqueDigits(num) {
  let arr = String(num).split('').sort();

  for (i = 0; i < arr.length - 1; i += 1) {
    if (arr[i] === arr[i + 1]) return false;
  }

  return true;
}

function featured(num) {
  if (num >= 9876543201) return 'There is no possible number that fulfills those requirements.'

  do {
    num += 1;
  } while (num % 7 !== 0 || num % 2 !== 1);

  while (!uniqueDigits(num)) num += 14;

  return num;
}

console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543186));   // 9876543201
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // "There is no possible number that fulfills those requirements."