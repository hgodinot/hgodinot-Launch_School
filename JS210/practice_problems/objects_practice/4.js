function wordCount(str) {
  let result = {};
  str.split(' ').forEach(wrd => result[wrd] !== undefined? result[wrd] += 1 : result[wrd] = 1);
  return result;
}

console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }