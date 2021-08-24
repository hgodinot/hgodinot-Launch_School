function triangle(...args) {
  args.sort((a, b) => a - b);

  if (args[0] <= 0 || args.reduce((acc, el) => acc + el) !== 180) return 'invalid';
  if (args[2] === 90) return 'right';
  if (args[2] > 90) return 'obtuse';
  return 'acute';
}


console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"