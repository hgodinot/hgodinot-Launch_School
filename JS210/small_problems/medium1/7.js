function fibonacci(num) {
  let [a, b] = [1, 1]

  for (i = 3; i <= num; i += 1) {
    [b, a] = [a + b, b];
  }

  return b;
}

console.log(fibonacci(2));        // 1
console.log(fibonacci(20));       // 6765
console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(75));       // 2111485077978050