let centerOf = str => {
  let middle = Math.ceil(str.length / 2) - 1;
  let ending = middle + 2 - str.length % 2;
  return str.slice(middle, ending);
}

console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"