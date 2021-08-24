//Reversing a Process 6 Kuy Kata

function decode(string) {
  let num = Number(string.match(/\d+/g));
  let chrArray = string.match(/[a-z]+/g)[0]
                  .split('')
                  .map(chr => chr.charCodeAt() - 97);
  let result = ''

  for (let i = 0; i < chrArray.length; i += 1) {
    let noKey = true;
    let chrCounter = 0;
    while (noKey) {
      if (chrCounter * num % 26 === chrArray[i]) {
        result += String.fromCharCode(97 + chrCounter);
        noKey = false;
      }

      chrCounter += 1;
      if (chrCounter >= 26) return 'Impossible to decode';
    }
  }
  //console.log(num)
  //console.log(chrArray)
  return result;
}

console.log(decode('6015ekx')); //'mer'
console.log(decode('5057aan')); //'Impossible to decode'
console.log(decode('1544749cdcizljymhdmvvypyjamowl')); //
console.log(decode('105860ymmgegeeiwaigsqkcaeguicc')); //
console.log(decode('1273409kuqhkoynvvknsdwljif')); //


