//Steps in Primes 6Kyu Kata to finish once studied this (works as such but does not pass tests)

function primesBetween(m, n) {
  let primes = [3]

  for (let i = 5; i <= n; i += 2) {
    if (!primes.filter(prime => prime <= Math.sqrt(i)).some(prime => i % prime === 0)) {
      primes.push(i);
    }
  }

  return primes.filter(prime => prime >= m);
}

function step(g, m, n) {
  let rangePrimes = primesBetween(m, n);
  
  for (let i = 0; i < rangePrimes.length - 1; i += 1) {
    if (rangePrimes.includes(rangePrimes[i] + g)) {
      return [rangePrimes[i], rangePrimes[i] + g];
    }
  }

  return null;
}

console.log(primesBetween(300, 400))

console.log(step(2,100,110)); // [101, 103])
console.log(step(4,100,110)); // [103, 107])
console.log(step(6,100,110)); // [101, 107])

console.log(step(8,300,400)); // [359, 367])
console.log(step(10,300,400)); // [307, 317])
console.log(step(10,5,9)); // null

/*
PEDAC

Input: 3 numbers
Output: Array of numbers or null

Rules: 
In the interval between m and b, must find the first pair of primes numbers whose step between is g, and return it (or null if none)
There can be other prime numbers between our solution's primes: 103 is prime but step(6,100,110) solution is [101, 107]

Data:
Work with an array of primes, and compare them

Algorythm:

Declare an array and push all primes between m & n in it

Use helper method findPrime to get prime numbers between n and m (more efficient)
  start from 3, then add 2 at every step.
  As we go compare candidates with the prime array (till root of candidate)and push them in it if true
  stop at n
  return a filtered array x only numbers > m

For loop over all the numbers of the array
  For each number, if number + g included in the array, then we return this number and number + g

  At the end, after the loop (no solution), we return null

*/