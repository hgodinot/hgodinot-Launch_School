let leadingSubstrings = str => str.split('').map((_, idx) => str.slice(0, idx + 1));

function substrings(str) {
  let result = [];

  for (let i = 0; i < str.length; i += 1) {
    result.push(...leadingSubstrings(str.slice(i)));
  }

  return result;
}


console.log(substrings('abcde'));