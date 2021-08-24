function sum(array) {
  return array.reduce((acc, num) => acc + num);
}

function average(array) {
  return sum(array) / array.length;
}

console.log(sum([1, 2, 3, 4, 11]));
console.log(average([1, 2, 3, 4, 11]));