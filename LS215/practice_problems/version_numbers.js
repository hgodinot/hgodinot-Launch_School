function invalidArgument(str) {
  return typeof(str) !== 'string' || str.trim() === '' ||
         str.match(/([^0-9\.]|\.\.|^\.|\.$)/) || !str.match(/[0-9]/);
}

let compareResult = (a, b) => a > b ? 1 : -1;

function compareVersions(version1, version2) {
  if (invalidArgument(version1) || invalidArgument(version2)) return null;

  let first = version1.split('.').map(str => Number(str));
  let second= version2.split('.').map(str => Number(str));

  let minIndex = Math.min(first.length, second.length);

  for (i = 0; i < minIndex; i += 1) {
    if (first[i] != second[i]) return compareResult(first[i], second[i]);
  }

  if (first.length > second.length) {
    return first.slice(minIndex).some(n => n > 0) ? 1 : 0;
  } else if (first.length < second.length) {
    return second.slice(minIndex).some(n => n > 0) ? -1 : 0;
  } else {
    return 0;
  }
}

console.log(compareVersions('1', '1') === 0);
console.log(compareVersions('1', '1.0.0.0.0') === 0);
console.log(compareVersions('1', '1.0.0.0.1') === -1);
console.log(compareVersions('1.0.0.1', '1.0.0.0.1') === 1);
console.log(compareVersions('2', '1.9.9.9.9.9.9.9.9.9.9.9') === 1);
console.log(compareVersions('4.3.2.1', '4.3.2.1.1') === -1);

console.log(compareVersions('', '4.3.2.1.1') === null);
console.log(compareVersions('4.3.2.1..1', '4.3.2.1.1') === null);
console.log(compareVersions('4.3.2.1.1', '.4.3.2.1.1') === null);
console.log(compareVersions('4.3.2.1.1', '.4.3.2.1.1.') === null);
console.log(compareVersions('4.3.a.1.1', '.4.3.2.1.1.') === null);
console.log(compareVersions('4.3.1.1', '.') === null);
console.log(compareVersions('4.3..1.1', '7.') === null);
console.log(compareVersions(4, '4') === null);

/*



PEDAC

Compare 2 numbers that may be version numbers.

Input: String composed of numbers and dots (.) Dots delimitate versions
Output: One of 3 numbers (1, -1, 0)

Rules:
1 = 1.0 = 1.0.0.0.0....
Compare every number of the series to the other. As soon as one is different, comparison is over.

Edge cases:
Bad input:
  No string ? Accept numbers and convert to Strings ? 
  Empty string

  No versions numbers

  Not only numbers and dots
  More than one dot at a time
  More than one num at a time except if at the beginning ? Is it legal ? Let's say yes.
  No number in the string
  Missing argument(s)

  Assuming good inputs


DataStructure:

Array of numbers (split method) created from two strings.

Algorythm:

Convert both argument into arrays of numbers with the split method with dot/. as a delimitator
Take the shorter array (length) and loop from 0 to this array length - 1 (for loop)
  If at any moment the numbers are different return a result
  If at the end it's still equal check if any of the remaining numbers is greater than 0 (slice n & some method)
    If yes return result (greater), else 0

*/
