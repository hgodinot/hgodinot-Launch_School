function squareRoot(num) {
  if (num < 0) {
    throw new Error("Root of a negative number"); // side effect: raises an exception
  }

  return Math.sqrt(num);
}

console.log(squareRoot(7));
console.log(squareRoot(-7));