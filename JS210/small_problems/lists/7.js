let leadingSubstrings = str => str.split('').map((_, idx) => str.slice(0, idx + 1));

function substrings(str) {
  let result = [];

  for (let i = 0; i < str.length; i += 1) {
    result.push(...leadingSubstrings(str.slice(i)));
  }

  return result;
}

let isPalindrome = str => str.length > 1 && str === str.split('').reverse().join('');

let palindromes = str => substrings(str).filter(isPalindrome);


console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]

  console.log(palindromes('knitting cassettes'));
// returns
[ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]