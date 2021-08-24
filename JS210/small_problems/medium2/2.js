function triangle(...args) {
  args.sort((a, b) => a - b);

  if (args[0] <= 0 || args[2] > args[0] + args[1]) return 'invalid';
  if (args[0] === args[2]) return 'equilateral';
  if (args[0] === args[1] || args[1] === args[2]) return 'isosceles';
  return 'scalene';
}

console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"