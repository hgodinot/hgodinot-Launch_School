let range = n => [...Array(n).keys()].map(idx => idx + 1);

let squareSum = arr => Math.pow(arr.reduce((acc, el) => acc + el), 2);

let sumSquares = arr => arr.map(x => x ** 2).reduce((acc, el) => acc + el);

let sumSquareDifference = num => squareSum(range(num)) - sumSquares(range(num));


console.log(sumSquareDifference(3));      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));     // 2640
console.log(sumSquareDifference(1));      // 0
console.log(sumSquareDifference(100));    // 25164150