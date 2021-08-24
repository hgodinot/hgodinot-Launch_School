function wordSizes(str) {
  let result = {};
  if (str.trim() === '')return result;

  str.split(' ').map(wrd => wrd.length).sort().forEach( length => {
    result[String(length)]? result[String(length)] += 1 : result[String(length)] = 1;
  });

  return result;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
console.log(wordSizes("What's up doc?"));                              // { "2": 1, "4": 1, "6": 1 }
console.log(wordSizes(''));                                            // {}