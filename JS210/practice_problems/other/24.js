function substring(string, start, end) {
  let result = '';
  
  if (isNaN(start) || start < 0) start = 0;

  if (end) {
    if (isNaN(end) || end < 0) {
      end = 0;
    }
  } else {
    end = string.length;
  }

  let max = Math.max(start, end);
  let min = Math.min(start, end);

  for (i = min; i < max; i += 1) {
    if (string[i]) result += string[i];
  }

  return result;
}

let string = 'hello world';

console.log(substring(string, 2, 4));    // "ll"
console.log(substring(string, 4, 2));    // "ll"
console.log(substring(string, 0, -1));   // ""
console.log(substring(string, 2));       // "llo world"
console.log(substring(string, 'a'));     // "hello world"
console.log(substring(string, 8, 20));   // "rld"

