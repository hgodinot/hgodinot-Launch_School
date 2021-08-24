function numberRange(int) {
  if (int < 0) {
    console.log(int + " is less than 0");
  } else if (int <= 50) {
    console.log(int + " is between 0 and 50");
  } else if (int <= 100) {
    console.log(int + " is between 51 and 100");
  }
  else {
    console.log(int + " is greater than 100");
  }
}

numberRange(25);
numberRange(75);
numberRange(125);
numberRange(-25);