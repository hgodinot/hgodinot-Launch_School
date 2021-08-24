
/*
function range(...args) {
  [start, end] = args.length > 1 ? [args[0], args[1]] : [0, args[0]];
  const range = [];

  for (let element = start; element <= end; element++) {
    range.push(element);
  }

  return range;
}
*/

//Better way to get a range:
//let range = (...args) => [...Array(args[1] - args[0] + 1)].map((_, idx) => idx + args[0]);

function range(...args) {
  [start, end] = args.length > 1 ? [args[0], args[1]] : [0, args[0]];
  return [...Array(end - start + 1)].map((_, idx) => idx + start);
}

// Examples

console.log(range(10, 20));
console.log(range(5));