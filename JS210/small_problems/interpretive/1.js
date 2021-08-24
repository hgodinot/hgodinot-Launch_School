function lightsOn(switches) {
  if (switches < 1) return [];
  let lights = [...Array(switches)].map(on => false);
  
  for (i = 0; i < lights.length; i += 1) {
    for (idx = i; idx < lights.length; idx += i + 1) {
      lights[idx] = !lights[idx];
    }
  }

  return lights.map((val, idx) => val !== false ? idx + 1 : val).filter(val => val);
}

/*

Input: Number. Positive integer (let's assume) ? At least 1 ?
Output: array of numbers corresponding to switchs that are one.

Edge cases: 1: return empty arrays. Shoudl return empty array if n < 1

Data: Array of boolean that I will convert around, from true to false to true...

Algorythm:
Create an array with switches element: [...Array(5)].map(x => false)
loop from 0 to index switches - 1 (for loop)
for i: loop again, new for loop this time from i to switches - 1, adding i + 1 every time
At every iteration switch boolean

Map on this array and convert on lights to their index, keep the other. Filter on it and keep non false value. Return it


*/

console.log(lightsOn(5));        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]