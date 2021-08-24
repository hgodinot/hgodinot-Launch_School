function century(year) {
  let number = String(Math.ceil(year/100));
  let suffix = '';

  if (number.substr(-1) === '0' || number.substr(-1) > '3'|| number.substr(-2, 1) === '1') {
    suffix = 'th';
  } else if (number.substr(-1) === '1') {
    suffix = 'st';
  } else if (number.substr(-1) === '2') {
    suffix = 'nd';
  } else if (number.substr(-1) === '3') {
    suffix = 'rd';
  }

  return number + suffix;
}

console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"



