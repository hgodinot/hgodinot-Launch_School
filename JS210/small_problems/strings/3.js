function letterCaseCount(str) {
  let result = {};

  result.lowercase = str.replace(/[^a-z]/g, '').length;
  result.uppercase = str.replace(/[^A-Z]/g, '').length;
  result.neither = str.length - result.uppercase - result.lowercase;

  return result;
}


console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }