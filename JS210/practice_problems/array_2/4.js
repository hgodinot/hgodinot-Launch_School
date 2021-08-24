function concat(...args) {
  let result = [];

  args.forEach(arg => Array.isArray(arg) ? arg.forEach(val => result.push(val)) : result.push(arg));

  return result;
}


/*
Or more briefly
function concat(...args) {
  return args.flat();
}
*/

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]