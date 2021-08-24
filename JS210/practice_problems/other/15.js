let allPrimes = (num) => {
  let primes = [2];
  for (let candidate = 3; candidate <= num; candidate += 2) {
    prime = true;

    for (let index = 0; primes[index] <= Math.floor(Math.sqrt(candidate)); index += 1) {
      if (candidate % primes[index] === 0) prime = false;
    }

    if (prime) primes.push(candidate);
  }

  return primes;
}

let checkGoldbach = (num) => {
  let result = [];
  let primes = allPrimes(num);
  let length = primes.length;

  for (index1 = 0; index1 < length; index1 += 1) {
    for (index2 = index1; index2 < length; index2 += 1) {
      if (primes[index1] + primes[index2] === num) result.push([primes[index1], primes[index2]]);
    }
  }
  
  if (result.length === 0) {
    console.log (`\nThere is no prime pair that sum up to ${num}.`);
  } else {
    console.log(`\nThe prime pairs that sum up to ${num} are:`);
    result.forEach(pair => console.log(pair[0] + " " + pair[1]));
  }
}


checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53

