function sequence(n) {
  result = [];

  for (i = 1; i <= n; i += 1) {
    result.push(i);
  }

  return result;
}

/* Or this nice solution, replacement for Ruby's Range object:

function sequence(number) {
  return [...Array(number).keys()].map(num => num + 1);
}

*/

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]