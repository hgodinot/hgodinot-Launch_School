function splitString(string, delimiter) {
  let print = [];
  let candidate = ''

  if (delimiter === undefined) {
    console.log('Error: No delimiter');
    return;
  }

  for (let i = 0; i < string.length; i += 1) {
    if (string[i] === delimiter) {
      print.push(candidate);
      candidate = '';
    } else {
      candidate += string[i];
      if (delimiter === '') {
        print.push(candidate);
        candidate = '';
      }
    }
  }

  if (candidate) {
    print.push(candidate);
  }

  print.forEach( str => console.log(str));
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello