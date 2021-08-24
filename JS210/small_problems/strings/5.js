
function swapCase(str) {
  return str.split('')
            .map(chr => /[A-Z]/.test(chr) ? chr.toLowerCase() : chr.toUpperCase())
            .join('');
}


//or: let swapCase = str => str.split('').map(chr => /[A-Z]/.test(chr) ? chr.toLowerCase() : chr.toUpperCase()).join('');

console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"