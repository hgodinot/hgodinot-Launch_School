function validInput(arr) {
  return Array.isArray(arr) && arr.length === 3 && arr.every(n => typeof(n) === 'number');
}


function triangleShape(arr) {
  if (!validInput(arr)) return 'Invalid input';
  arr.sort((a, b) => a - b);

  if (arr[0] <= 0 || arr[2] >= arr[0] + arr[1]) return 'Invalid';
  if (arr[0] === arr[2]) return 'Equilateral';
  if (arr[0] === arr[1] || arr[1] === arr[2]) return 'Iscosceles';
  return 'Scalene';
}

console.log(triangleShape([1, 2, '7']) === 'Invalid input');
console.log(triangleShape([1, 2, 4, 8]) === 'Invalid input');

console.log(triangleShape([1, 1, 2]) === 'Invalid');
console.log(triangleShape([0, 1, 2]) === 'Invalid');
console.log(triangleShape([0, 0, 0]) === 'Invalid');

console.log(triangleShape([1, 1, 1]) === 'Equilateral');
console.log(triangleShape([5, 5, 5]) === 'Equilateral');

console.log(triangleShape([3, 2, 2]) === 'Iscosceles');
console.log(triangleShape([3, 5, 3]) === 'Iscosceles');

console.log(triangleShape([2, 3, 4]) === 'Scalene');
console.log(triangleShape([4, 6, 5]) === 'Scalene');



/*PEDAC
Input: Array of 3 numbers. 
Outpût: String with one of three shapes or "invalid"

Rules

Valid:
  All sides > 1
  No side equal or greater to sum of other two sides
Equilateral: 3 have same length
Isosceles: 2 sides same lenght
If none of these, scalene

Data:
Array

Algorythm:
Check that input is valid or return "Invalid input, must be array of 3 numbers"
Order array from lower to greater number (sort method
Check that triangle is valid. If not return "invalid"
Check in that order, and return value if true:
  equilateral
  isosceles
If none, return scalene


*/