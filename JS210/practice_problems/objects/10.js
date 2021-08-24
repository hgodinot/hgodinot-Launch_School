const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

function afterMidnight(timeStr) {
  let hours = Number(timeStr.slice(0, 2));
  let mins = Number(timeStr.slice(3, 5));
  let date = new Date (0, 0, 0, hours, mins);

  return date.getHours() * MINUTES_PER_HOUR + date.getMinutes();
}

function beforeMidnight(timeStr) {
  if (!timeStr.match(/[1-9]/)) return 0;
  return MINUTES_PER_DAY - afterMidnight(timeStr);
}

console.log(afterMidnight('00:00'));       // 0
console.log(beforeMidnight('00:00'));      // 0
console.log(afterMidnight('12:34'));       // 754
console.log(beforeMidnight('12:34'));      // 686