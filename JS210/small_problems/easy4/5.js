function interleave(...arr) {
  let result = [];

  for (let i = 0; i < arr[0].length; i += 1) {
    arr.forEach(subarr => result.push(subarr[i]))
  }
  return result;
}

console.log(interleave([1, 2, 3], ['a', 'b', 'c']));    // [1, "a", 2, "b", 3, "c"]