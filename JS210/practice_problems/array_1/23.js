function oddElementsOf(arr) {
  let oddArr = [];

  for (i = 0; i < arr.length; i += 1) {
    if (i % 2 === 1) oddArr.push(arr[i]);
  }
  
  return oddArr;
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits));    // returns [8, 16, 42]