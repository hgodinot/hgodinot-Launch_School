function convertChar(chr, key) {
  if (!chr.match(/[a-z]/i)) return chr;

  let [lowerLimit, higherLimit] = chr.match(/[a-z]/) ? ['a'.charCodeAt(), 'z'.charCodeAt()] : ['A'.charCodeAt(), 'Z'.charCodeAt()];
  num = chr.charCodeAt() + key % 26;
  
  if (num > higherLimit) num = num % higherLimit + lowerLimit - 1;
  
  return String.fromCharCode(num);
}

let caesarEncrypt = (str, key = 0) => str.split('').map(chr => convertChar(chr, key)).join('');

/*
input: String. Convert it, can be an absence of conversion. Key = number, 0 by default. 
Assume valid inputs.

Output: New string, encryped

Rules: 
To convert:
  Only convert letters (match /a-z/i). Return char as such otherwise
  If letter check is lowercase or uppercase. 
  Add key % 26 to character code If charcode > limit (90 or 122), then add lower limit(64 or 96) + number % higher limit


  65-90: Caps
  97-122: lower
*/



// simple shift
console.log(caesarEncrypt('A', 0));       // "A"
console.log(caesarEncrypt('A', 3));       // "D"

// wrap around
console.log(caesarEncrypt('y', 5));       // "d"
console.log(caesarEncrypt('a', 47));      // "v"

// all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2));
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"