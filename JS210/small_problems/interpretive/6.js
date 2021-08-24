function generateLine(idx, num, size) {
  return ' '.repeat(idx) + '*' + ' '.repeat(num - idx - 1) + '*' + ' '.repeat(num - idx - 1) + '*' + ' '.repeat(idx);
}

function star(n) {
  let upperLines = [];
  let numLines = (n - 1) / 2;
  
  for (i = 0; i < numLines; i += 1) upperLines.push(generateLine(i, numLines, n));

  let middleLine = ['*'.repeat(n)];
  let lowerLines = upperLines.slice(0).reverse();
  
  [...upperLines, ...middleLine, ...lowerLines].forEach(line => console.log(line));
}

star(7);
star(9);

/*
Input : Integer >= 7; Assume it's good.
Output: We log a 8 pointed stars by printing several lines of * and blank spaces.

Rules : 8 points
n by n grid

3 parts: Upper and lower are reverse
Middle is '*'.repeat(n)
First line of upper is *, (n - 3) blanck spaces, start, same blanck, star
Then we start star one further at every line until 3 stars touch
Number of line in an half = (n - 1) / 2
*/