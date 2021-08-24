function diamond(n) {
  let padding = [];
  let empty = (n - 1) / 2;

  for (i = empty; i > 0; i -= 1) {
    padding.push(' '.repeat(i) + '*'.repeat(n - 2 * i) + ' '.repeat(i));
  }

  padding.forEach(line => console.log(line));
  console.log('*'.repeat(n));
  padding.reverse().forEach(line => console.log(line));
}

/*
Input: Positive odd integer
Output: None, but log numbers of lines equal to n

4 empty, 1 star, 4 empty
3 empty, 3 stars, 3 empty
2 empty, 5 stars, 2 empty
1 empty, 7 stars, 1 empty
0 empty, 9 stars, 1 empty

Intermedia lines:
Empty start: n - 1 / 2
At every step: -1 empty on each side + 2 stars

Mid line: All stars

Reverse intermedia lines

Reversed

Then print before, mid, before reversed

create lines: 
declare variable padding
empty = (n - 1) / 2
Interate with for loop for empty to 1.
fill in padding with x spaces + (stars - 2 * idx) stars + x spaces + \n

*/

diamond(1);
/*

*

*/

diamond(3);
/*

 *
***
 *
 * 
 */

 diamond(9);
/*
     *
    ***
   *****
  *******
 *********
  *******
   *****
    ***
     *
*/