function letterLength(str) {
  return str.split('')
     .filter(char => (char.toLowerCase() >= 'a' && char.toLowerCase() <= 'z'))
     .join('')
     .length;
}

function wordSizes(str) {
  let result = {};
  if (str.trim() === '')return result;

  str.split(' ').map(wrd => letterLength(wrd)).sort().forEach( length => {
    result[String(length)]? result[String(length)] += 1 : result[String(length)] = 1;
  });

  return result;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}