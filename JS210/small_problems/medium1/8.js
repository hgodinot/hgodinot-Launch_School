function fibonacci(num) {
  let fibArray = [1, 1]

  for (i = 3; i <= num; i += 1) {
    fibArray.push(fibArray.slice(-2).reduce((acc, el) => acc + el));
  } 

  return fibArray[num - 1];
}


console.log(fibonacci(2));        // 1
console.log(fibonacci(20));       // 6765
console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(75));       // 2111485077978050
