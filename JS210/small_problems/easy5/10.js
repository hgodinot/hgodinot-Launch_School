function reverseWords(str) {
  return str.split(' ').map(wrd => {
    return wrd.length < 5 ? wrd : wrd.split('').reverse().join('');
  }).join(' ');
}

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"