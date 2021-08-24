Date.prototype.addDays = function(days) {
  var date = new Date(this.valueOf());
  date.setDate(date.getDate() + days);
  return date;
}

function fridayThe13ths(num) {
  let date = new Date(`January 1, ${num}`);
  let count = 0;

  do {
    if (date.getDay() === 5 && date.getDate() === 13) count += 1;
    date = date.addDays(1);
  } while (date.getFullYear() === num);

  return count;
}

console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2