function dms(num) {
  if (num < 0) num += 360; 
  const DEGREES = Math.floor(num);
  let rest = (num % DEGREES) * 60 || 0;

  const MINUTES = Math.floor(rest);
  const SECONDS = Math.floor((rest % MINUTES) * 60) || 0;

  return `${DEGREES}°${padZero(MINUTES)}'${padZero(SECONDS)}"`;
}

function padZero(num) {
  return num < 10? '0' + String(num) : String(num);
}

console.log(dms(30));           // 30°00'00"
console.log(dms(76.73));        // 76°43'48"
console.log(dms(254.6));        // 254°35'59"
console.log(dms(93.034773));    // 93°02'05"
console.log(dms(0));            // 0°00'00"
console.log(dms(360));          // 360°00'00" or 0°00'00"

