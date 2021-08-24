let sortedWord = str => str.split('').sort().join('');

function anagram(word, list) {
  return list.filter(wrd => sortedWord(wrd) === sortedWord(word));
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]