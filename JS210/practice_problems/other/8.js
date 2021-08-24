function logMultiples(num) {
  for (let i = 99; i >= num; i -= 2) {
    if (i % num === 0) console.log(i);
  }
}

logMultiples(21);