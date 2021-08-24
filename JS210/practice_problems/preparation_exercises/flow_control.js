function evenOrOdd (number) {
  if (!Number.isInteger(number)) {
    console.log(number + " is not an integer!")
    return;
  }

  switch (number % 2) {
    case 1:
      console.log(number + " is odd!");
      break;
    case 0:
      console.log(number + " is even!");
      break;
  }
}

evenOrOdd (1);
evenOrOdd (2);
evenOrOdd (2.57);
