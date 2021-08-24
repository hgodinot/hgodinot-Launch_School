function staggeredCase(str) {
  let even = false;

  return str.split('')
            .map(chr => {
              if (!/[a-z]/i.test(chr)) return chr;

              even = !even;
              if (even) {
                return chr.toUpperCase();
              } else {
                return chr.toLowerCase();
              }

            })
            .join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"