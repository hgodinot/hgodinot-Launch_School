//Disgruntled Employee Kyu 6

function off(n) {
  let switches = [...Array(n)].map(x => false);

  for (i = 0; i < n; i += 1) {
    for (idx = i; idx < n; idx += i + 1) {
      switches[idx] = !switches[idx];
    }
  }
  
  return switches.map((x, idx) => x ? idx + 1 : x).filter(x => x);
}

console.log(off(1)); // [1]
console.log(off(2)); // [1]
console.log(off(4)); // [1, 4]
console.log(off(9)); // [1, 4, 9]

/*
PEDAC

Input: number >= 1

Output: array of ascending numbers (off switched)

Rules: 
Start: All switches are off (true)
Then switch every 2 switch, every 3... till every n


[off, on, on, off]

Data:
Array of booleans whose value I will iterate over and map around from true (off) to false (on)

Algo:
Start with array of n length, all elements are false
from i = 2 to n switch every n element in the array (for loop in the for loop)
Return at the end mapped array with index + 1 instead of true for off switchs then filter it
*/