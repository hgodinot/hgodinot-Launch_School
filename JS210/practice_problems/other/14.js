let gcd = (first, second) => {
  let min = Math.min(first, second);
  for (let candidate = min; candidate >= 1; candidate -= 1) {
    if (first % candidate === 0 && second % candidate === 0) {
      result = candidate;
      break
    }
  }
  return result;
}


console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1