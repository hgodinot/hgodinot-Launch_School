function countdown(count) {
  (function numLog(num) {
    console.log(num);
    if (num > 0) numLog(num - 1);
  })(count);

  console.log('Done!');
}

countdown(7);