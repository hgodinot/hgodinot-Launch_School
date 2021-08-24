function penultimate(string) {
  return string.split(' ')[string.split(' ').length -2];
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"