function wordCap(str) {
  return str.split(' ')
            .map(wrd => wrd[0].toUpperCase() + wrd.slice(1).toLowerCase())
            .join(' ');
}

console.log(wordCap('four score and seven'));       // "Four Score And Seven"
console.log(wordCap('the javaScript language'));    // "The Javascript Language"
console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'