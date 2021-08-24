let generatePattern = (num) => {
  for (let n = 1; n <= num; n += 1) {
    string = '';

    for (let nbr = 1; nbr <= (n); nbr += 1) {
      string += nbr;
    }

    for (let str = 0; str < (num - n); str += 1) {
      string += '*';
    }

    console.log(string);
  }
}


generatePattern(20);

/*

1******
12*****
123****
1234***
12345**
123456*
1234567

*/