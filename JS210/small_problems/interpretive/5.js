const LOWERCASE = [...Array(26)].map((x, idx) => String.fromCharCode(97 + idx));

function convertChar(chr, key) {
  if (!chr.match(/[a-z]/i)) return chr;

  let [lowerLimit, higherLimit] = chr.match(/[a-z]/) ? ['a'.charCodeAt(), 'z'.charCodeAt()] : ['A'.charCodeAt(), 'Z'.charCodeAt()];
  num = chr.charCodeAt() + key % 26;
  
  if (num > higherLimit) num = num % higherLimit + lowerLimit - 1;
  
  return String.fromCharCode(num);
}

function vigenereCipher(str, keyWord) {
  let key = keyWord.toLowerCase().split('').map(chr => LOWERCASE.indexOf(chr));
  let keyCount = -1;

  return str.split('')
            .map(chr => {
              if (chr.match(/[a-z]/i)) {
                keyCount += 1;
                return convertChar(chr, key[keyCount % key.length]);
              } else {
                return chr;
              }
            })
            .join('')
}

let test = "Pineapples don't go on pizzas!"
let keyword = "meat"

console.log(vigenereCipher(test, keyword));
//Bmnxmtpeqw dhz'x gh ar pbldal!