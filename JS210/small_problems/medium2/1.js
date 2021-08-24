function letterPercentages(str) {
  let count = [0, 0, 0];

  str.split('').forEach(chr => {
    if (chr.match(/[a-z]/)) {
      count[0] += 1; 
    } else if (chr.match(/[A-Z]/)) {
      count[1] += 1;
    } else {
      count[2] += 1;
    }
  })

  let total = count.reduce((acc, el) => acc + el);
  count = count.map(n => Number.parseFloat(n * 100 / total).toFixed(2));

  return {lowercase: count[0], upperrcase: count[1], neither: count[2]};
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }