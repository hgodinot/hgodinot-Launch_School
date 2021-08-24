function reverse(array) {
  reversedArray = [];

  for (let i = array.length - 1; i >= 0; i -= 1) {
    reversedArray.push(array[i]);
  }

  return reversedArray;
}

console.log(reverse(['Steve', 'Martha', 'Pat']));