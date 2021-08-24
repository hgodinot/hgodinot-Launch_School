let isPrime = (num) => {
  prime = true;

  if (num < 2 || (num !== 2 && num % 2 == 0)) {
    prime = false;
  } else {
    for (let candidate = 3; candidate <= Math.floor(Math.sqrt(num)); candidate += 2) {
      if (num % candidate === 0) prime = false;
    }
  }

  console.log(prime);
}

isPrime(1);   // false
isPrime(2);   // true
isPrime(3);   // true
isPrime(43);  // true
isPrime(55);  // false
isPrime(0);   // false