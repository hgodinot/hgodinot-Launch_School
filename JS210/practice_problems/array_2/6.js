
function reverse(input) {
  let result;

  if (typeof(input) === 'string') {
    result = '';
  } else if (Array.isArray(input)) {
    result = [];
  } else {
    return 'Cannot reverse. Argument must be an array or a string.';
  }

  for (i = input.length - 1; i >= 0; i -= 1) {
    typeof(input) === 'string'? result += input[i] : result.push(input[i]);
  }

  return result;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]

console.log(reverse(133))
