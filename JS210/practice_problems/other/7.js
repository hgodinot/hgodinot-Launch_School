function multiplesOfThreeAndFive() {
  for (let i = 1; i <= 100; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(i + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(i);
    }
  }
}

multiplesOfThreeAndFive();