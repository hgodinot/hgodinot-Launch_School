function dateSuffix(day) {
  if ([1, 21, 31].includes(day)) {
    return 'st';
  } else if ([2, 22].includes(day)) {
    return 'nd';
  } else if ([3, 23].includes(day)) {
    return 'rd';
  } else {
    return 'th';
  }
}

let today = new Date();

let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
let month = months[today.getMonth()];

let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
let weekDay = daysOfWeek[today.getDay()];

let monthDay = today.getDate();
let daySuffix = dateSuffix(monthDay);


console.log(`Today's day is ${weekDay}, ${month} ${monthDay + daySuffix}`);



let tomorrow = new Date(today.getTime());
tomorrow.setDate(today.getDate() + 1);

