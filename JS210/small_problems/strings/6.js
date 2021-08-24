//let staggeredCase = str => str.split('').map((chr, i) => i % 2 == 0 ? chr.toUpperCase() : chr.toLowerCase()).join('');

function staggeredCase(str) {
  return str.split('')
            .map((chr, i) => i % 2 == 0 ? chr.toUpperCase() : chr.toLowerCase())
            .join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
console.log(staggeredCase('ignore 77 the 4444 numbers'));   // "IgNoRe 77 ThE 4444 nUmBeRs"